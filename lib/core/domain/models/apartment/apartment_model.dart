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
    @JsonKey(name: "apartment_id") required String apartmentId,
    @JsonKey(name: "user_id") @Default('') String userId,

    @JsonKey(name: "created_at", includeToJson: false) @Default('') String createdAt,
    @JsonKey(name: "name") @Default(null) String? name,
    @JsonKey(name: "location") @Default(null) String? location,
    @JsonKey(name: "county") @Default(null) String? county,
    @JsonKey(name: "sub_county") @Default(null) String? subCounty,
    @JsonKey(name: "ward") @Default(null) String? ward,
    @JsonKey(name: "description") @Default(null) String? description,
    @JsonKey(name: "latitude") @Default(null) double? latitude,
    @JsonKey(name: "longitude") @Default(null) double? longitude,
    @JsonKey(name: "cover_image_url") @Default(null) String? coverImageUrl,
  }) = _ApartmentModel;

  factory ApartmentModel.fromJson(Map<String, dynamic> json) =>
      _$ApartmentModelFromJson(json);
}
