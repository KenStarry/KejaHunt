import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

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