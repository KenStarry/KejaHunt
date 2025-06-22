import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:keja_hunt/core/di/locator.dart';
import 'package:keja_hunt/core/utils/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/models/house_unit_model.dart';
import '../../../domain/models/unit_image_model.dart';

mixin UploadUnitMixin {
  final supabase = locator.get<SupabaseClient>();

  Future<Uint8List?> compressFile(File file) async {
    var result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 1080,
      minHeight: 1080,
      quality: 85,
      format: CompressFormat.jpeg,
    );

    return result;
  }

  /// Upload Images to Supabase
  Future<void> uploadImagesToSupabaseStorage({
    required List<UnitImageModel> imageModels,
    required String userId,
    required String unitId,
  }) async {
    final List<String> uploadedUrls = [];

    await Future.wait(
      imageModels.map((imageModel) async {
        final fileExtension = imageModel.imageFile!.path.split('.').last;
        final uniqueStorageName =
            'unit_$unitId/${imageModel.imageTag.isEmpty ? 'Unlabelled' : imageModel.imageTag}/${DateTime.now().millisecondsSinceEpoch}_${imageModels.indexOf(imageModel)}.$fileExtension';

        final storagePath = uniqueStorageName;

        // final fileBytes = await imageModel.imageFile!.readAsBytes();
        final fileBytes = await compressFile(File(imageModel.imageFile!.path));

        if (fileBytes == null) {
          throw Exception('Image compression failed');
        }

        final response = await supabase.storage
            .from(unitImagesBucket)
            .uploadBinary(storagePath, fileBytes);

        if (response.isEmpty) throw Exception('Upload Failed for $storagePath');

        final publicUrl = supabase.storage
            .from(unitImagesBucket)
            .getPublicUrl(storagePath);

        uploadedUrls.add(publicUrl);

        final updatedImageModel = imageModel.copyWith(
          imageUrl: publicUrl,
          unitId: unitId,
          userId: userId,
        );

        /// Once you have gotten the url, upload the image to the images table
        await supabase
            .from(imagesTable)
            .upsert(updatedImageModel.toJson(), onConflict: 'image_url');
      }),
    );

    // return uploadedUrls;
  }

  Future<void> uploadHouseUnit({required HouseUnitModel houseUnitModel}) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in');
    }

    final updatedHouseModel = houseUnitModel.copyWith(userId: user.id);

    /// Upload the Unit
    final uploadedUnitModelResponse = await supabase
        .from(unitsTable)
        .upsert(
          updatedHouseModel.toJson(),
          onConflict: 'user_id,apartment_id,unit_type,price,price_frequency',
          ignoreDuplicates: false,
        )
        .select()
        .maybeSingle();

    /// Get The Unit that has been uploaded with the ID
    if (uploadedUnitModelResponse == null) {
      throw Exception('Upsert failed: no row returned');
    }

    final unitId = uploadedUnitModelResponse['unit_id'] as String;

    /// Upload to the Images Table the new images
    await uploadImagesToSupabaseStorage(
      imageModels: houseUnitModel.images,
      userId: user.id,
      unitId: unitId,
    );
    // await supabase.from(imagesTable)
    // .upsert(houseUnitModel.)
  }
}
