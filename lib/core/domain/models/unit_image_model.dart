import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'unit_image_model.freezed.dart';

part 'unit_image_model.g.dart';

@freezed
class UnitImageModel with _$UnitImageModel {
  const factory UnitImageModel({
    @JsonKey(name: "image_id", includeToJson: false) @Default('') String imageId,
    @JsonKey(name: "uploaded_at", includeToJson: false) @Default('') String uploadedAt,
    @JsonKey(name: "unit_id") @Default('') String unitId,
    @JsonKey(name: "user_id") @Default('') String userId,
    @JsonKey(name: "image_url") @Default('') String imageUrl,
    @JsonKey(name: "image_tag") @Default('') String imageTag,
    @JsonKey(includeToJson: false, includeFromJson: false) @Default(null) XFile? imageFile,
  }) = _UnitImageModel;

  factory UnitImageModel.fromJson(Map<String, dynamic> json) =>
      _$UnitImageModelFromJson(json);
}
