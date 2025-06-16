// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseUnitModelImpl _$$HouseUnitModelImplFromJson(Map<String, dynamic> json) =>
    _$HouseUnitModelImpl(
      unitId: json['unit_id'] as String? ?? '',
      apartmentId: json['apartment_id'] as String? ?? '',
      unitType: json['unit_type'] as String? ?? '',
      floor: (json['floor'] as num?)?.toInt() ?? 1,
      rentAmount: (json['rent_amount'] as num?)?.toDouble() ?? 0.00,
      availableCount: (json['available_count'] as num?)?.toInt() ?? 1,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$$HouseUnitModelImplToJson(
        _$HouseUnitModelImpl instance) =>
    <String, dynamic>{
      'unit_id': instance.unitId,
      'apartment_id': instance.apartmentId,
      'unit_type': instance.unitType,
      'floor': instance.floor,
      'rent_amount': instance.rentAmount,
      'available_count': instance.availableCount,
      'images': instance.images,
      'features': instance.features,
      'created_at': instance.createdAt,
    };
