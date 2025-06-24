import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_price_frequency_enum.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/domain/models/unit_image_model.dart';
import 'package:keja_hunt/core/utils/supabase_constants.dart';

part 'house_unit_model.freezed.dart';

part 'house_unit_model.g.dart';

@freezed
class HouseUnitModel with _$HouseUnitModel {
  const factory HouseUnitModel({

    /// Primary Keys
    @JsonKey(name: "unit_id", includeToJson: false) @Default('') String unitId,
    @JsonKey(name: "user_id") @Default('') String userId,
    @JsonKey(name: "apartment_id") required String apartmentId,
    @JsonKey(name: "unit_type") required String unitType,

    @JsonKey(name: "created_at", includeToJson: false) @Default('') String createdAt,
    @JsonKey(name: "title") @Default('') String title,
    @JsonKey(name: "description") @Default('') String description,
    @JsonKey(name: "price") required double price,
    @JsonKey(name: "price_frequency") @Default('month') String priceFrequency,
    @JsonKey(name: "features") @Default(<UnitFeatureModel>[]) List<UnitFeatureModel> features,

    /// A 1 bdr in Jojo House can be in 1st, 2nd, 5th floors
    @JsonKey(name: "floors") @Default([1]) List<int> floors,

    /// How many 1 brs are left
    @JsonKey(name: "available_units_count") @Default(1) int availableUnitsCount,

    /// Unit Images - Copy from the response from the images table - Get it From the SQL Join
    @JsonKey(name: unitImagesTable, includeToJson: false, includeFromJson: true) @Default(<UnitImageModel>[]) List<UnitImageModel> images,
  }) = _HouseUnitModel;

  factory HouseUnitModel.fromJson(Map<String, dynamic> json) =>
      _$HouseUnitModelFromJson(json);
}
