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
  @JsonKey(name: "unit_id")
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: "apartment_id")
  String get apartmentId => throw _privateConstructorUsedError;
  @JsonKey(name: "apartment_name")
  String get apartmentName => throw _privateConstructorUsedError;
  @JsonKey(name: "unit_type")
  String get unitType => throw _privateConstructorUsedError;
  @JsonKey(name: "floor")
  int get floor => throw _privateConstructorUsedError;
  @JsonKey(name: "rent_amount")
  double get rentAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "available_count")
  int get availableCount => throw _privateConstructorUsedError;
  @JsonKey(name: "images")
  List<String> get images => throw _privateConstructorUsedError;
  @JsonKey(name: "features")
  List<String> get features => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "unit_id") String unitId,
      @JsonKey(name: "apartment_id") String apartmentId,
      @JsonKey(name: "apartment_name") String apartmentName,
      @JsonKey(name: "unit_type") String unitType,
      @JsonKey(name: "floor") int floor,
      @JsonKey(name: "rent_amount") double rentAmount,
      @JsonKey(name: "available_count") int availableCount,
      @JsonKey(name: "images") List<String> images,
      @JsonKey(name: "features") List<String> features,
      @JsonKey(name: "created_at") String createdAt});
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
    Object? apartmentId = null,
    Object? apartmentName = null,
    Object? unitType = null,
    Object? floor = null,
    Object? rentAmount = null,
    Object? availableCount = null,
    Object? images = null,
    Object? features = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      apartmentId: null == apartmentId
          ? _value.apartmentId
          : apartmentId // ignore: cast_nullable_to_non_nullable
              as String,
      apartmentName: null == apartmentName
          ? _value.apartmentName
          : apartmentName // ignore: cast_nullable_to_non_nullable
              as String,
      unitType: null == unitType
          ? _value.unitType
          : unitType // ignore: cast_nullable_to_non_nullable
              as String,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      rentAmount: null == rentAmount
          ? _value.rentAmount
          : rentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      availableCount: null == availableCount
          ? _value.availableCount
          : availableCount // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(name: "unit_id") String unitId,
      @JsonKey(name: "apartment_id") String apartmentId,
      @JsonKey(name: "apartment_name") String apartmentName,
      @JsonKey(name: "unit_type") String unitType,
      @JsonKey(name: "floor") int floor,
      @JsonKey(name: "rent_amount") double rentAmount,
      @JsonKey(name: "available_count") int availableCount,
      @JsonKey(name: "images") List<String> images,
      @JsonKey(name: "features") List<String> features,
      @JsonKey(name: "created_at") String createdAt});
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
    Object? apartmentId = null,
    Object? apartmentName = null,
    Object? unitType = null,
    Object? floor = null,
    Object? rentAmount = null,
    Object? availableCount = null,
    Object? images = null,
    Object? features = null,
    Object? createdAt = null,
  }) {
    return _then(_$HouseUnitModelImpl(
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      apartmentId: null == apartmentId
          ? _value.apartmentId
          : apartmentId // ignore: cast_nullable_to_non_nullable
              as String,
      apartmentName: null == apartmentName
          ? _value.apartmentName
          : apartmentName // ignore: cast_nullable_to_non_nullable
              as String,
      unitType: null == unitType
          ? _value.unitType
          : unitType // ignore: cast_nullable_to_non_nullable
              as String,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      rentAmount: null == rentAmount
          ? _value.rentAmount
          : rentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      availableCount: null == availableCount
          ? _value.availableCount
          : availableCount // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HouseUnitModelImpl implements _HouseUnitModel {
  const _$HouseUnitModelImpl(
      {@JsonKey(name: "unit_id") this.unitId = '',
      @JsonKey(name: "apartment_id") this.apartmentId = '',
      @JsonKey(name: "apartment_name") this.apartmentName = '',
      @JsonKey(name: "unit_type") this.unitType = '',
      @JsonKey(name: "floor") this.floor = 1,
      @JsonKey(name: "rent_amount") this.rentAmount = 0.00,
      @JsonKey(name: "available_count") this.availableCount = 1,
      @JsonKey(name: "images") final List<String> images = const [],
      @JsonKey(name: "features") final List<String> features = const [],
      @JsonKey(name: "created_at") this.createdAt = ''})
      : _images = images,
        _features = features;

  factory _$HouseUnitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseUnitModelImplFromJson(json);

  @override
  @JsonKey(name: "unit_id")
  final String unitId;
  @override
  @JsonKey(name: "apartment_id")
  final String apartmentId;
  @override
  @JsonKey(name: "apartment_name")
  final String apartmentName;
  @override
  @JsonKey(name: "unit_type")
  final String unitType;
  @override
  @JsonKey(name: "floor")
  final int floor;
  @override
  @JsonKey(name: "rent_amount")
  final double rentAmount;
  @override
  @JsonKey(name: "available_count")
  final int availableCount;
  final List<String> _images;
  @override
  @JsonKey(name: "images")
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<String> _features;
  @override
  @JsonKey(name: "features")
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  @JsonKey(name: "created_at")
  final String createdAt;

  @override
  String toString() {
    return 'HouseUnitModel(unitId: $unitId, apartmentId: $apartmentId, apartmentName: $apartmentName, unitType: $unitType, floor: $floor, rentAmount: $rentAmount, availableCount: $availableCount, images: $images, features: $features, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseUnitModelImpl &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId) &&
            (identical(other.apartmentName, apartmentName) ||
                other.apartmentName == apartmentName) &&
            (identical(other.unitType, unitType) ||
                other.unitType == unitType) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.rentAmount, rentAmount) ||
                other.rentAmount == rentAmount) &&
            (identical(other.availableCount, availableCount) ||
                other.availableCount == availableCount) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      unitId,
      apartmentId,
      apartmentName,
      unitType,
      floor,
      rentAmount,
      availableCount,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_features),
      createdAt);

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
          {@JsonKey(name: "unit_id") final String unitId,
          @JsonKey(name: "apartment_id") final String apartmentId,
          @JsonKey(name: "apartment_name") final String apartmentName,
          @JsonKey(name: "unit_type") final String unitType,
          @JsonKey(name: "floor") final int floor,
          @JsonKey(name: "rent_amount") final double rentAmount,
          @JsonKey(name: "available_count") final int availableCount,
          @JsonKey(name: "images") final List<String> images,
          @JsonKey(name: "features") final List<String> features,
          @JsonKey(name: "created_at") final String createdAt}) =
      _$HouseUnitModelImpl;

  factory _HouseUnitModel.fromJson(Map<String, dynamic> json) =
      _$HouseUnitModelImpl.fromJson;

  @override
  @JsonKey(name: "unit_id")
  String get unitId;
  @override
  @JsonKey(name: "apartment_id")
  String get apartmentId;
  @override
  @JsonKey(name: "apartment_name")
  String get apartmentName;
  @override
  @JsonKey(name: "unit_type")
  String get unitType;
  @override
  @JsonKey(name: "floor")
  int get floor;
  @override
  @JsonKey(name: "rent_amount")
  double get rentAmount;
  @override
  @JsonKey(name: "available_count")
  int get availableCount;
  @override
  @JsonKey(name: "images")
  List<String> get images;
  @override
  @JsonKey(name: "features")
  List<String> get features;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;

  /// Create a copy of HouseUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseUnitModelImplCopyWith<_$HouseUnitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
