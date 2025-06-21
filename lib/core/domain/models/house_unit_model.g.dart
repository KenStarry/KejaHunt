// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseUnitModelImpl _$$HouseUnitModelImplFromJson(Map<String, dynamic> json) =>
    _$HouseUnitModelImpl(
      unitId: json['unit_id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      apartmentId: json['apartment_id'] as String,
      unitType: json['unit_type'] as String,
      createdAt: json['created_at'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
      priceFrequency: json['price_frequency'] as String? ?? 'month',
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => UnitFeatureModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <UnitFeatureModel>[],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => UnitImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <UnitImageModel>[],
      floors: (json['floors'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [1],
      availableUnitsCount:
          (json['available_units_count'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$HouseUnitModelImplToJson(
        _$HouseUnitModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'apartment_id': instance.apartmentId,
      'unit_type': instance.unitType,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'price_frequency': instance.priceFrequency,
      'features': instance.features,
      'images': instance.images,
      'floors': instance.floors,
      'available_units_count': instance.availableUnitsCount,
    };
