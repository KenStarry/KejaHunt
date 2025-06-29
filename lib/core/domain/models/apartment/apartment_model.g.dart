// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApartmentModelImpl _$$ApartmentModelImplFromJson(Map<String, dynamic> json) =>
    _$ApartmentModelImpl(
      apartmentId: json['apartment_id'] as String,
      userId: json['user_id'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      name: json['name'] as String? ?? null,
      location: json['location'] as String? ?? null,
      county: json['county'] as String? ?? null,
      subCounty: json['sub_county'] as String? ?? null,
      ward: json['ward'] as String? ?? null,
      description: json['description'] as String? ?? null,
      latitude: (json['latitude'] as num?)?.toDouble() ?? null,
      longitude: (json['longitude'] as num?)?.toDouble() ?? null,
      coverImageUrl: json['cover_image_url'] as String? ?? null,
    );

Map<String, dynamic> _$$ApartmentModelImplToJson(
        _$ApartmentModelImpl instance) =>
    <String, dynamic>{
      'apartment_id': instance.apartmentId,
      'user_id': instance.userId,
      'name': instance.name,
      'location': instance.location,
      'county': instance.county,
      'sub_county': instance.subCounty,
      'ward': instance.ward,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'cover_image_url': instance.coverImageUrl,
    };
