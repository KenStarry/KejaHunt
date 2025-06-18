// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitImageModelImpl _$$UnitImageModelImplFromJson(Map<String, dynamic> json) =>
    _$UnitImageModelImpl(
      imageId: json['image_id'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      imageTag: json['image_tag'] as String? ?? '',
    );

Map<String, dynamic> _$$UnitImageModelImplToJson(
        _$UnitImageModelImpl instance) =>
    <String, dynamic>{
      'image_id': instance.imageId,
      'image_url': instance.imageUrl,
      'image_tag': instance.imageTag,
    };
