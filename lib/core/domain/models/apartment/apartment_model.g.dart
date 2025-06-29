// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApartmentModelImpl _$$ApartmentModelImplFromJson(Map<String, dynamic> json) =>
    _$ApartmentModelImpl(
      apartmentId: json['apartment_id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      county: json['county'] as String? ?? '',
      subCounty: json['sub_county'] as String? ?? '',
      ward: json['ward'] as String? ?? '',
      description: json['description'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      coverImageUrl: json['cover_image_url'] as String? ?? null,
    );

Map<String, dynamic> _$$ApartmentModelImplToJson(
        _$ApartmentModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'location': instance.location,
      'county': instance.county,
      'sub_county': instance.subCounty,
      'ward': instance.ward,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
