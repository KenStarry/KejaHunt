import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_feature_groups_enum.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_feature_level_enum.dart';

part 'unit_feature_model.freezed.dart';

part 'unit_feature_model.g.dart';

@freezed
class UnitFeatureModel with _$UnitFeatureModel {
  const factory UnitFeatureModel({
    @JsonKey(name: "feature_name") @Default('') String featureName,
    @JsonKey(name: "feature_group") @Default('') String featureGroup,
    @JsonKey(name: "feature_level") @Default('') String featureLevel,
    @JsonKey(name: "feature_icon_path") @Default('') String featureIconPath,
  }) = _UnitFeatureModel;

  factory UnitFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$UnitFeatureModelFromJson(json);
}
