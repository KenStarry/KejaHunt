import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';

import '../../domain/enum/units/unit_feature_groups_enum.dart';
import '../../domain/enum/units/unit_feature_level_enum.dart';

final List<UnitFeatureModel> allFeatures = [
  // Inside the Unit
  UnitFeatureModel(featureName: 'Built-in wardrobes', featureIconPath: "assets/images/icons/features/wardrobe.svg", featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Ensuite bathroom', featureIconPath: "assets/images/icons/features/ensuite_bath.svg",featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Bathtub', featureIconPath: "assets/images/icons/features/bathtub.svg", featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Hot shower',featureIconPath: "assets/images/icons/features/shower.svg", featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Closed kitchen', featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Open kitchen', featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Pantry', featureIconPath: "assets/images/icons/features/pantry.svg",featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Tiled floors', featureIconPath: "assets/images/icons/features/tiles.svg",featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Wooden floors', featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Ceiling fans', featureIconPath: "assets/images/icons/features/fan.svg",featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Air conditioning', featureIconPath: "assets/images/icons/features/conditioner.svg",featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Balcony/patio', featureIconPath: "assets/images/icons/features/balcony.svg",featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Laundry area', featureIconPath: "assets/images/icons/features/laundry.svg",featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Wifi',featureIconPath: "assets/images/icons/features/wifi.svg", featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'DSTV/TV connection', featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Storage room', featureGroup: UnitFeatureGroupsEnum.insideUnit.name, featureLevel: UnitFeatureLevelEnum.unit.name),

  // Building/Complex
  UnitFeatureModel(featureName: 'Elevator/lift', featureGroup: UnitFeatureGroupsEnum.buildingComplex.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Rooftop access', featureGroup: UnitFeatureGroupsEnum.buildingComplex.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Water tanks', featureGroup: UnitFeatureGroupsEnum.buildingComplex.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Backup generator', featureGroup: UnitFeatureGroupsEnum.buildingComplex.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Borehole/well water', featureGroup: UnitFeatureGroupsEnum.buildingComplex.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Garbage chute', featureGroup: UnitFeatureGroupsEnum.buildingComplex.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Intercom system', featureGroup: UnitFeatureGroupsEnum.buildingComplex.name, featureLevel: UnitFeatureLevelEnum.apartment.name),

  // Security
  UnitFeatureModel(featureName: '24/7 security', featureGroup: UnitFeatureGroupsEnum.security.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'CCTV surveillance', featureGroup: UnitFeatureGroupsEnum.security.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Electric fence', featureGroup: UnitFeatureGroupsEnum.security.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Security lights', featureGroup: UnitFeatureGroupsEnum.security.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Gated community', featureGroup: UnitFeatureGroupsEnum.security.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Guard patrol', featureGroup: UnitFeatureGroupsEnum.security.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Access control', featureGroup: UnitFeatureGroupsEnum.security.name, featureLevel: UnitFeatureLevelEnum.apartment.name),

  // Parking & Transport
  UnitFeatureModel(featureName: 'Free parking', featureGroup: UnitFeatureGroupsEnum.parkingTransport.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Visitors’ parking', featureGroup: UnitFeatureGroupsEnum.parkingTransport.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Covered parking', featureGroup: UnitFeatureGroupsEnum.parkingTransport.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Designated parking spot', featureGroup: UnitFeatureGroupsEnum.parkingTransport.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Public transport nearby', featureGroup: UnitFeatureGroupsEnum.parkingTransport.name, featureLevel: UnitFeatureLevelEnum.apartment.name),

  // Outdoor & Shared Spaces
  UnitFeatureModel(featureName: 'Garden', featureGroup: UnitFeatureGroupsEnum.outdoorShared.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Swimming pool', featureGroup: UnitFeatureGroupsEnum.outdoorShared.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Kids play area', featureGroup: UnitFeatureGroupsEnum.outdoorShared.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Courtyard', featureGroup: UnitFeatureGroupsEnum.outdoorShared.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Rooftop terrace', featureGroup: UnitFeatureGroupsEnum.outdoorShared.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Barbecue area', featureGroup: UnitFeatureGroupsEnum.outdoorShared.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Gym/fitness center', featureGroup: UnitFeatureGroupsEnum.outdoorShared.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Lounge/recreation area', featureGroup: UnitFeatureGroupsEnum.outdoorShared.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Clubhouse', featureGroup: UnitFeatureGroupsEnum.outdoorShared.name, featureLevel: UnitFeatureLevelEnum.apartment.name),

  // Utilities & Services
  UnitFeatureModel(featureName: 'City council water', featureGroup: UnitFeatureGroupsEnum.utilitiesServices.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Borehole water', featureGroup: UnitFeatureGroupsEnum.utilitiesServices.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Water included in rent', featureGroup: UnitFeatureGroupsEnum.utilitiesServices.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Prepaid electricity', featureGroup: UnitFeatureGroupsEnum.utilitiesServices.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Token meter', featureGroup: UnitFeatureGroupsEnum.utilitiesServices.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Garbage collection included', featureGroup: UnitFeatureGroupsEnum.utilitiesServices.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Cleaning services', featureGroup: UnitFeatureGroupsEnum.utilitiesServices.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Laundry services', featureGroup: UnitFeatureGroupsEnum.utilitiesServices.name, featureLevel: UnitFeatureLevelEnum.apartment.name),

  // Nearby Amenities
  UnitFeatureModel(featureName: 'Close to school', featureGroup: UnitFeatureGroupsEnum.nearbyAmenities.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Close to supermarket', featureGroup: UnitFeatureGroupsEnum.nearbyAmenities.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Close to hospital/clinic', featureGroup: UnitFeatureGroupsEnum.nearbyAmenities.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Close to university', featureGroup: UnitFeatureGroupsEnum.nearbyAmenities.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Near highway or major road', featureGroup: UnitFeatureGroupsEnum.nearbyAmenities.name, featureLevel: UnitFeatureLevelEnum.apartment.name),
  UnitFeatureModel(featureName: 'Close to public transport stage', featureGroup: UnitFeatureGroupsEnum.nearbyAmenities.name, featureLevel: UnitFeatureLevelEnum.apartment.name),

  // Accessibility
  UnitFeatureModel(featureName: 'Wheelchair accessible', featureGroup: UnitFeatureGroupsEnum.accessibility.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Ramp access', featureGroup: UnitFeatureGroupsEnum.accessibility.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'Elderly-friendly', featureGroup: UnitFeatureGroupsEnum.accessibility.name, featureLevel: UnitFeatureLevelEnum.unit.name),
  UnitFeatureModel(featureName: 'No stairs', featureGroup: UnitFeatureGroupsEnum.accessibility.name, featureLevel: UnitFeatureLevelEnum.unit.name),
];

