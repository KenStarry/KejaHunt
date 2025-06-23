import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_feature_model.freezed.dart';

part 'unit_feature_model.g.dart';

@freezed
class UnitFeatureModel with _$UnitFeatureModel {
  const factory UnitFeatureModel({
    @JsonKey(name: "feature_name") @Default('') String featureName,
    @JsonKey(name: "feature_description") @Default(null) String? featureDescription,
    @JsonKey(name: "feature_icon_path") @Default('') String featureIconPath,
  }) = _UnitFeatureModel;

  factory UnitFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$UnitFeatureModelFromJson(json);
}
