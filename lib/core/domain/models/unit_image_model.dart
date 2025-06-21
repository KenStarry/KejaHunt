import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_image_model.freezed.dart';

part 'unit_image_model.g.dart';

@freezed
class UnitImageModel with _$UnitImageModel {
  const factory UnitImageModel({
    @JsonKey(name: "image_url") @Default('') String imageUrl,
    @JsonKey(name: "image_tag") @Default('') String imageTag,
  }) = _UnitImageModel;

  factory UnitImageModel.fromJson(Map<String, dynamic> json) =>
      _$UnitImageModelFromJson(json);
}
