import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_unit_model.freezed.dart';

part 'house_unit_model.g.dart';

@freezed
class HouseUnitModel with _$HouseUnitModel {
  const factory HouseUnitModel({
    @JsonKey(name: "unit_id") @Default('') String unitId,
    @JsonKey(name: "apartment_id") @Default('') String apartmentId,
    @JsonKey(name: "unit_type") @Default('') String unitType,
    @JsonKey(name: "floor") @Default(1) int floor,
    @JsonKey(name: "rent_amount") @Default(0.00) double rentAmount,
    @JsonKey(name: "available_count") @Default(1) int availableCount,
    @JsonKey(name: "images") @Default([]) List<String> images,
    @JsonKey(name: "features") @Default([]) List<String> features,
    @JsonKey(name: "created_at") @Default('') String createdAt,
  }) = _HouseUnitModel;

  factory HouseUnitModel.fromJson(Map<String, dynamic> json) =>
      _$HouseUnitModelFromJson(json);
}
