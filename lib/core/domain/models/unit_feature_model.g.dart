// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_feature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitFeatureModelImpl _$$UnitFeatureModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UnitFeatureModelImpl(
      featureId: json['feature_id'] as String? ?? '',
      featureName: json['feature_name'] as String? ?? '',
      featureDescription: json['feature_description'] as String? ?? null,
      featureIconPath: json['feature_icon_path'] as String? ?? '',
    );

Map<String, dynamic> _$$UnitFeatureModelImplToJson(
        _$UnitFeatureModelImpl instance) =>
    <String, dynamic>{
      'feature_id': instance.featureId,
      'feature_name': instance.featureName,
      'feature_description': instance.featureDescription,
      'feature_icon_path': instance.featureIconPath,
    };
