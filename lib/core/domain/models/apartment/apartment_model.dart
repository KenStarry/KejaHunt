import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_price_frequency_enum.dart';
import 'package:keja_hunt/core/domain/models/agents/agent_model.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/domain/models/unit_image_model.dart';
import 'package:keja_hunt/core/domain/models/units/unit_review_model.dart';
import 'package:keja_hunt/core/features/auth/domain/models/user_model.dart';
import 'package:keja_hunt/core/utils/supabase_constants.dart';

part 'apartment_model.freezed.dart';

part 'apartment_model.g.dart';

@freezed
class ApartmentModel with _$ApartmentModel {

  const factory ApartmentModel({

    /// Primary Keys
    @JsonKey(name: "apartment_id", includeToJson: false) @Default('') String apartmentId,
    @JsonKey(name: "user_id") @Default('') String userId,

    @JsonKey(name: "created_at", includeToJson: false) @Default('') String createdAt,
    @JsonKey(name: "name") @Default('') String name,
    @JsonKey(name: "location") @Default('') String location,
    @JsonKey(name: "county") @Default('') String county,
    @JsonKey(name: "sub_county") @Default('') String subCounty,
    @JsonKey(name: "ward") @Default('') String ward,
    @JsonKey(name: "description") @Default('') String description,
    @JsonKey(name: "latitude") @Default(0) double? latitude,
    @JsonKey(name: "longitude") @Default(0) double? longitude,
    @JsonKey(name: "cover_image_url", includeToJson: false) @Default(null) String? coverImageUrl,

    @JsonKey(name: "coverImage", includeToJson: false, includeFromJson: false) @Default(null) XFile? coverImage,
  }) = _ApartmentModel;

  factory ApartmentModel.fromJson(Map<String, dynamic> json) =>
      _$ApartmentModelFromJson(json);
}
