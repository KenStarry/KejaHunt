// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_feature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitFeatureModelImpl _$$UnitFeatureModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UnitFeatureModelImpl(
      featureName: json['feature_name'] as String? ?? '',
      featureGroup: json['feature_group'] as String? ?? '',
      featureLevel: json['feature_level'] as String? ?? '',
      featureIconPath: json['feature_icon_path'] as String? ?? '',
    );

Map<String, dynamic> _$$UnitFeatureModelImplToJson(
        _$UnitFeatureModelImpl instance) =>
    <String, dynamic>{
      'feature_name': instance.featureName,
      'feature_group': instance.featureGroup,
      'feature_level': instance.featureLevel,
      'feature_icon_path': instance.featureIconPath,
    };
