import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../features/auth/domain/models/user_model.dart';
import '../../../utils/supabase_constants.dart';

part 'unit_review_model.freezed.dart';

part 'unit_review_model.g.dart';

@freezed
class UnitReviewModel with _$UnitReviewModel {
  const factory UnitReviewModel({
    @JsonKey(name: "id", includeToJson: false) @Default(0) int imageId,
    @JsonKey(name: "created_at", includeToJson: false) @Default('') String createdAt,
    @JsonKey(name: "updated_at", includeToJson: false) @Default('') String updatedAt,
    @JsonKey(name: "unit_id") @Default('') String unitId,
    @JsonKey(name: "user_id") @Default('') String userId,
    @JsonKey(name: "rating") @Default(null) double? rating,
    @JsonKey(name: "review_message") @Default('') String reviewMessage,
    @JsonKey(name: 'reviewer', includeToJson: false, includeFromJson: true) @Default(null) UserModel? userWhoReviewed,
  }) = _UnitReviewModel;

  factory UnitReviewModel.fromJson(Map<String, dynamic> json) =>
      _$UnitReviewModelFromJson(json);
}
