import 'package:flutter_image_compress/flutter_image_compress.dart';

class ApartmentUploadDetailsModel {
  final String name;
  final String description;
  final double? lat;
  final double? lng;
  final XFile coverImage;

  ApartmentUploadDetailsModel({
    required this.name,
    required this.description,
    required this.lat,
    required this.lng,
    required this.coverImage,
  });
}
