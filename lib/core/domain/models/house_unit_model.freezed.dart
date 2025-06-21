// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house_unit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HouseUnitModel _$HouseUnitModelFromJson(Map<String, dynamic> json) {
  return _HouseUnitModel.fromJson(json);
}

/// @nodoc
mixin _$HouseUnitModel {
  /// Primary Keys
  @JsonKey(name: "unit_id", includeToJson: false)
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "apartment_id")
  String get apartmentId => throw _privateConstructorUsedError;
  @JsonKey(name: "unit_type")
  String get unitType => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at", includeToJson: false)
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: "price_frequency")
  String get priceFrequency => throw _privateConstructorUsedError;
  @JsonKey(name: "features")
  List<UnitFeatureModel> get features => throw _privateConstructorUsedError;
  @JsonKey(name: "images")
  List<UnitImageModel> get images => throw _privateConstructorUsedError;

  /// A 1 bdr in Jojo House can be in 1st, 2nd, 5th floors
  @JsonKey(name: "floors")
  List<int> get floors => throw _privateConstructorUsedError;

  /// How many 1 brs are left
  @JsonKey(name: "available_units_count")
  int get availableUnitsCount => throw _privateConstructorUsedError;

  /// Serializes this HouseUnitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HouseUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseUnitModelCopyWith<HouseUnitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseUnitModelCopyWith<$Res> {
  factory $HouseUnitModelCopyWith(
          HouseUnitModel value, $Res Function(HouseUnitModel) then) =
      _$HouseUnitModelCopyWithImpl<$Res, HouseUnitModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "unit_id", includeToJson: false) String unitId,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "apartment_id") String apartmentId,
      @JsonKey(name: "unit_type") String unitType,
      @JsonKey(name: "created_at", includeToJson: false) String createdAt,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "price") double price,
      @JsonKey(name: "price_frequency") String priceFrequency,
      @JsonKey(name: "features") List<UnitFeatureModel> features,
      @JsonKey(name: "images") List<UnitImageModel> images,
      @JsonKey(name: "floors") List<int> floors,
      @JsonKey(name: "available_units_count") int availableUnitsCount});
}

/// @nodoc
class _$HouseUnitModelCopyWithImpl<$Res, $Val extends HouseUnitModel>
    implements $HouseUnitModelCopyWith<$Res> {
  _$HouseUnitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HouseUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unitId = null,
    Object? userId = null,
    Object? apartmentId = null,
    Object? unitType = null,
    Object? createdAt = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? priceFrequency = null,
    Object? features = null,
    Object? images = null,
    Object? floors = null,
    Object? availableUnitsCount = null,
  }) {
    return _then(_value.copyWith(
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      apartmentId: null == apartmentId
          ? _value.apartmentId
          : apartmentId // ignore: cast_nullable_to_non_nullable
              as String,
      unitType: null == unitType
          ? _value.unitType
          : unitType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      priceFrequency: null == priceFrequency
          ? _value.priceFrequency
          : priceFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<UnitFeatureModel>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<UnitImageModel>,
      floors: null == floors
          ? _value.floors
          : floors // ignore: cast_nullable_to_non_nullable
              as List<int>,
      availableUnitsCount: null == availableUnitsCount
          ? _value.availableUnitsCount
          : availableUnitsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseUnitModelImplCopyWith<$Res>
    implements $HouseUnitModelCopyWith<$Res> {
  factory _$$HouseUnitModelImplCopyWith(_$HouseUnitModelImpl value,
          $Res Function(_$HouseUnitModelImpl) then) =
      __$$HouseUnitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "unit_id", includeToJson: false) String unitId,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "apartment_id") String apartmentId,
      @JsonKey(name: "unit_type") String unitType,
      @JsonKey(name: "created_at", includeToJson: false) String createdAt,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "price") double price,
      @JsonKey(name: "price_frequency") String priceFrequency,
      @JsonKey(name: "features") List<UnitFeatureModel> features,
      @JsonKey(name: "images") List<UnitImageModel> images,
      @JsonKey(name: "floors") List<int> floors,
      @JsonKey(name: "available_units_count") int availableUnitsCount});
}

/// @nodoc
class __$$HouseUnitModelImplCopyWithImpl<$Res>
    extends _$HouseUnitModelCopyWithImpl<$Res, _$HouseUnitModelImpl>
    implements _$$HouseUnitModelImplCopyWith<$Res> {
  __$$HouseUnitModelImplCopyWithImpl(
      _$HouseUnitModelImpl _value, $Res Function(_$HouseUnitModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HouseUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unitId = null,
    Object? userId = null,
    Object? apartmentId = null,
    Object? unitType = null,
    Object? createdAt = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? priceFrequency = null,
    Object? features = null,
    Object? images = null,
    Object? floors = null,
    Object? availableUnitsCount = null,
  }) {
    return _then(_$HouseUnitModelImpl(
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      apartmentId: null == apartmentId
          ? _value.apartmentId
          : apartmentId // ignore: cast_nullable_to_non_nullable
              as String,
      unitType: null == unitType
          ? _value.unitType
          : unitType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      priceFrequency: null == priceFrequency
          ? _value.priceFrequency
          : priceFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<UnitFeatureModel>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<UnitImageModel>,
      floors: null == floors
          ? _value._floors
          : floors // ignore: cast_nullable_to_non_nullable
              as List<int>,
      availableUnitsCount: null == availableUnitsCount
          ? _value.availableUnitsCount
          : availableUnitsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HouseUnitModelImpl implements _HouseUnitModel {
  const _$HouseUnitModelImpl(
      {@JsonKey(name: "unit_id", includeToJson: false) this.unitId = '',
      @JsonKey(name: "user_id") this.userId = '',
      @JsonKey(name: "apartment_id") required this.apartmentId,
      @JsonKey(name: "unit_type") required this.unitType,
      @JsonKey(name: "created_at", includeToJson: false) this.createdAt = '',
      @JsonKey(name: "title") this.title = '',
      @JsonKey(name: "description") this.description = '',
      @JsonKey(name: "price") required this.price,
      @JsonKey(name: "price_frequency") this.priceFrequency = 'month',
      @JsonKey(name: "features")
      final List<UnitFeatureModel> features = const <UnitFeatureModel>[],
      @JsonKey(name: "images")
      final List<UnitImageModel> images = const <UnitImageModel>[],
      @JsonKey(name: "floors") final List<int> floors = const [1],
      @JsonKey(name: "available_units_count") this.availableUnitsCount = 1})
      : _features = features,
        _images = images,
        _floors = floors;

  factory _$HouseUnitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseUnitModelImplFromJson(json);

  /// Primary Keys
  @override
  @JsonKey(name: "unit_id", includeToJson: false)
  final String unitId;
  @override
  @JsonKey(name: "user_id")
  final String userId;
  @override
  @JsonKey(name: "apartment_id")
  final String apartmentId;
  @override
  @JsonKey(name: "unit_type")
  final String unitType;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  final String createdAt;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "price")
  final double price;
  @override
  @JsonKey(name: "price_frequency")
  final String priceFrequency;
  final List<UnitFeatureModel> _features;
  @override
  @JsonKey(name: "features")
  List<UnitFeatureModel> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  final List<UnitImageModel> _images;
  @override
  @JsonKey(name: "images")
  List<UnitImageModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// A 1 bdr in Jojo House can be in 1st, 2nd, 5th floors
  final List<int> _floors;

  /// A 1 bdr in Jojo House can be in 1st, 2nd, 5th floors
  @override
  @JsonKey(name: "floors")
  List<int> get floors {
    if (_floors is EqualUnmodifiableListView) return _floors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_floors);
  }

  /// How many 1 brs are left
  @override
  @JsonKey(name: "available_units_count")
  final int availableUnitsCount;

  @override
  String toString() {
    return 'HouseUnitModel(unitId: $unitId, userId: $userId, apartmentId: $apartmentId, unitType: $unitType, createdAt: $createdAt, title: $title, description: $description, price: $price, priceFrequency: $priceFrequency, features: $features, images: $images, floors: $floors, availableUnitsCount: $availableUnitsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseUnitModelImpl &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId) &&
            (identical(other.unitType, unitType) ||
                other.unitType == unitType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceFrequency, priceFrequency) ||
                other.priceFrequency == priceFrequency) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._floors, _floors) &&
            (identical(other.availableUnitsCount, availableUnitsCount) ||
                other.availableUnitsCount == availableUnitsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      unitId,
      userId,
      apartmentId,
      unitType,
      createdAt,
      title,
      description,
      price,
      priceFrequency,
      const DeepCollectionEquality().hash(_features),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_floors),
      availableUnitsCount);

  /// Create a copy of HouseUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseUnitModelImplCopyWith<_$HouseUnitModelImpl> get copyWith =>
      __$$HouseUnitModelImplCopyWithImpl<_$HouseUnitModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseUnitModelImplToJson(
      this,
    );
  }
}

abstract class _HouseUnitModel implements HouseUnitModel {
  const factory _HouseUnitModel(
      {@JsonKey(name: "unit_id", includeToJson: false) final String unitId,
      @JsonKey(name: "user_id") final String userId,
      @JsonKey(name: "apartment_id") required final String apartmentId,
      @JsonKey(name: "unit_type") required final String unitType,
      @JsonKey(name: "created_at", includeToJson: false) final String createdAt,
      @JsonKey(name: "title") final String title,
      @JsonKey(name: "description") final String description,
      @JsonKey(name: "price") required final double price,
      @JsonKey(name: "price_frequency") final String priceFrequency,
      @JsonKey(name: "features") final List<UnitFeatureModel> features,
      @JsonKey(name: "images") final List<UnitImageModel> images,
      @JsonKey(name: "floors") final List<int> floors,
      @JsonKey(name: "available_units_count")
      final int availableUnitsCount}) = _$HouseUnitModelImpl;

  factory _HouseUnitModel.fromJson(Map<String, dynamic> json) =
      _$HouseUnitModelImpl.fromJson;

  /// Primary Keys
  @override
  @JsonKey(name: "unit_id", includeToJson: false)
  String get unitId;
  @override
  @JsonKey(name: "user_id")
  String get userId;
  @override
  @JsonKey(name: "apartment_id")
  String get apartmentId;
  @override
  @JsonKey(name: "unit_type")
  String get unitType;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  String get createdAt;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "price")
  double get price;
  @override
  @JsonKey(name: "price_frequency")
  String get priceFrequency;
  @override
  @JsonKey(name: "features")
  List<UnitFeatureModel> get features;
  @override
  @JsonKey(name: "images")
  List<UnitImageModel> get images;

  /// A 1 bdr in Jojo House can be in 1st, 2nd, 5th floors
  @override
  @JsonKey(name: "floors")
  List<int> get floors;

  /// How many 1 brs are left
  @override
  @JsonKey(name: "available_units_count")
  int get availableUnitsCount;

  /// Create a copy of HouseUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseUnitModelImplCopyWith<_$HouseUnitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
