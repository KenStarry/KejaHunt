import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:keja_hunt/core/di/locator.dart';
import 'package:keja_hunt/core/domain/models/unit_image_model.dart';
import 'package:keja_hunt/core/utils/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '';

mixin UnitImagesMixin {
  final imagePicker = locator.get<ImagePicker>();
  final supabase = locator.get<SupabaseClient>();

  /// File Picker for Mobile
  Future<List<XFile>> pickMultipleImages() async {
    final images = await imagePicker.pickMultiImage();

    return images;
  }
}
