import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:keja_hunt/core/di/locator.dart';
import 'package:keja_hunt/core/domain/models/apartment/apartment_model.dart';
import 'package:keja_hunt/core/utils/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/models/house_unit_model.dart';
import '../../../domain/models/unit_image_model.dart';
import '../../../utils/functions/file_compression.dart';

mixin UploadApartmentMixin {
  final supabase = locator.get<SupabaseClient>();

  /// Upload Images to Supabase
  Future<void> uploadApartmentImagesToSupabaseStorage({
    required List<XFile> images,
    required String userId,
    required String apartmentName,
    required String apartmentId,
  }) async {
    final List<String> uploadedUrls = [];

    await Future.wait(
      images.map((image) async {
        final fileExtension = image.path.split('.').last;
        final uniqueStorageName =
            '${apartmentName}_$apartmentId/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';

        final storagePath = uniqueStorageName;

        // final fileBytes = await imageModel.imageFile!.readAsBytes();
        final fileBytes = await compressFile(File(image.path));

        if (fileBytes == null) {
          throw Exception('Image compression failed');
        }

        final response = await supabase.storage
            .from(apartmentImagesBucket)
            .uploadBinary(storagePath, fileBytes);

        if (response.isEmpty) throw Exception('Upload Failed for $storagePath');

        final publicUrl = supabase.storage
            .from(apartmentImagesBucket)
            .getPublicUrl(storagePath);

        uploadedUrls.add(publicUrl);

        /// Once you have gotten the url, upload the image to the images table
        await supabase
            .from(apartmentsTable)
            .update({"cover_image_url": publicUrl})
            .eq("apartment_id", apartmentId);
      }),
    );

    // return uploadedUrls;
  }

  Future<void> uploadApartment({required ApartmentModel apartmentModel}) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in');
    }

    final updatedApartmentModel = apartmentModel.copyWith(userId: user.id);

    /// Upload the Apartment
    final uploadedApartmentResponse = await supabase
        .from(apartmentsTable)
        .upsert(
          updatedApartmentModel.toJson(),
          onConflict: 'apartment_id',
          ignoreDuplicates: false,
        )
        .select()
        .maybeSingle();

    /// Get The Apartment that has been uploaded with the ID
    if (uploadedApartmentResponse == null) {
      throw Exception('Upsert failed: no row returned');
    }

    final apartmentId = uploadedApartmentResponse['apartment_id'] as String;
    final apartmentName = uploadedApartmentResponse['name'] as String;

    /// Upload to the Images Table the new images
    await uploadApartmentImagesToSupabaseStorage(
      images: [apartmentModel.coverImage!],
      userId: user.id,
      apartmentId: apartmentId,
      apartmentName: apartmentName,
    );
  }
}
