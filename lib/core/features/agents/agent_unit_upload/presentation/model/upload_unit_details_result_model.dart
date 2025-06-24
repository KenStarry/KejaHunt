import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';

class UploadUnitDetailsResultModel {
  final String? unitType;
  final String? unitDescription;
  final String? apartmentId;
  final int rentAmount;
  final String? priceFrequency;
  final List<UnitFeatureModel>? selectedFeatures;

  UploadUnitDetailsResultModel({
    required this.unitType,
    required this.unitDescription,
    required this.apartmentId,
    required this.rentAmount,
    required this.priceFrequency,
    required this.selectedFeatures,
  });
}
