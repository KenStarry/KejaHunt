// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseUnitModelImpl _$$HouseUnitModelImplFromJson(Map<String, dynamic> json) =>
    _$HouseUnitModelImpl(
      unitId: json['unit_id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      agentId: json['agent_id'] as String? ?? '',
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
      floors: (json['floors'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [1],
      availableUnitsCount:
          (json['available_units_count'] as num?)?.toInt() ?? 1,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => UnitImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <UnitImageModel>[],
      reviews: (json['unit_reviews'] as List<dynamic>?)
              ?.map((e) => UnitReviewModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <UnitReviewModel>[],
      apartment: json['apartments'] == null
          ? null
          : ApartmentModel.fromJson(json['apartments'] as Map<String, dynamic>),
      agent: json['agents'] == null
          ? null
          : AgentModel.fromJson(json['agents'] as Map<String, dynamic>),
      agentUserModel: json['users'] == null
          ? null
          : UserModel.fromJson(json['users'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HouseUnitModelImplToJson(
        _$HouseUnitModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'agent_id': instance.agentId,
      'apartment_id': instance.apartmentId,
      'unit_type': instance.unitType,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'price_frequency': instance.priceFrequency,
      'features': instance.features,
      'floors': instance.floors,
      'available_units_count': instance.availableUnitsCount,
    };
