// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitImageModelImpl _$$UnitImageModelImplFromJson(Map<String, dynamic> json) =>
    _$UnitImageModelImpl(
      imageId: (json['image_id'] as num?)?.toInt() ?? 0,
      uploadedAt: json['uploaded_at'] as String? ?? '',
      unitId: json['unit_id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      imageTag: json['image_tag'] as String? ?? '',
    );

Map<String, dynamic> _$$UnitImageModelImplToJson(
        _$UnitImageModelImpl instance) =>
    <String, dynamic>{
      'unit_id': instance.unitId,
      'user_id': instance.userId,
      'image_url': instance.imageUrl,
      'image_tag': instance.imageTag,
    };
