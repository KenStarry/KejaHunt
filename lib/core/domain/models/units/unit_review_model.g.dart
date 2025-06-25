// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitReviewModelImpl _$$UnitReviewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UnitReviewModelImpl(
      imageId: (json['id'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      unitId: json['unit_id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      rating: (json['rating'] as num?)?.toInt() ?? null,
      reviewMessage: json['review_message'] as String? ?? '',
    );

Map<String, dynamic> _$$UnitReviewModelImplToJson(
        _$UnitReviewModelImpl instance) =>
    <String, dynamic>{
      'unit_id': instance.unitId,
      'user_id': instance.userId,
      'rating': instance.rating,
      'review_message': instance.reviewMessage,
    };
