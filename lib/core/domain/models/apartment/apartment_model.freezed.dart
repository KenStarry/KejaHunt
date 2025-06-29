// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apartment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApartmentModel _$ApartmentModelFromJson(Map<String, dynamic> json) {
  return _ApartmentModel.fromJson(json);
}

/// @nodoc
mixin _$ApartmentModel {
  /// Primary Keys
  @JsonKey(name: "apartment_id", includeToJson: false)
  String get apartmentId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at", includeToJson: false)
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "location")
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: "county")
  String get county => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_county")
  String get subCounty => throw _privateConstructorUsedError;
  @JsonKey(name: "ward")
  String get ward => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "latitude")
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: "longitude")
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: "cover_image_url", includeToJson: false)
  String? get coverImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "coverImage", includeToJson: false, includeFromJson: false)
  XFile? get coverImage => throw _privateConstructorUsedError;

  /// Serializes this ApartmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApartmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApartmentModelCopyWith<ApartmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApartmentModelCopyWith<$Res> {
  factory $ApartmentModelCopyWith(
          ApartmentModel value, $Res Function(ApartmentModel) then) =
      _$ApartmentModelCopyWithImpl<$Res, ApartmentModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "apartment_id", includeToJson: false) String apartmentId,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "created_at", includeToJson: false) String createdAt,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "location") String location,
      @JsonKey(name: "county") String county,
      @JsonKey(name: "sub_county") String subCounty,
      @JsonKey(name: "ward") String ward,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "latitude") double? latitude,
      @JsonKey(name: "longitude") double? longitude,
      @JsonKey(name: "cover_image_url", includeToJson: false)
      String? coverImageUrl,
      @JsonKey(name: "coverImage", includeToJson: false, includeFromJson: false)
      XFile? coverImage});
}

/// @nodoc
class _$ApartmentModelCopyWithImpl<$Res, $Val extends ApartmentModel>
    implements $ApartmentModelCopyWith<$Res> {
  _$ApartmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApartmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apartmentId = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? name = null,
    Object? location = null,
    Object? county = null,
    Object? subCounty = null,
    Object? ward = null,
    Object? description = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? coverImageUrl = freezed,
    Object? coverImage = freezed,
  }) {
    return _then(_value.copyWith(
      apartmentId: null == apartmentId
          ? _value.apartmentId
          : apartmentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      county: null == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String,
      subCounty: null == subCounty
          ? _value.subCounty
          : subCounty // ignore: cast_nullable_to_non_nullable
              as String,
      ward: null == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApartmentModelImplCopyWith<$Res>
    implements $ApartmentModelCopyWith<$Res> {
  factory _$$ApartmentModelImplCopyWith(_$ApartmentModelImpl value,
          $Res Function(_$ApartmentModelImpl) then) =
      __$$ApartmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "apartment_id", includeToJson: false) String apartmentId,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "created_at", includeToJson: false) String createdAt,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "location") String location,
      @JsonKey(name: "county") String county,
      @JsonKey(name: "sub_county") String subCounty,
      @JsonKey(name: "ward") String ward,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "latitude") double? latitude,
      @JsonKey(name: "longitude") double? longitude,
      @JsonKey(name: "cover_image_url", includeToJson: false)
      String? coverImageUrl,
      @JsonKey(name: "coverImage", includeToJson: false, includeFromJson: false)
      XFile? coverImage});
}

/// @nodoc
class __$$ApartmentModelImplCopyWithImpl<$Res>
    extends _$ApartmentModelCopyWithImpl<$Res, _$ApartmentModelImpl>
    implements _$$ApartmentModelImplCopyWith<$Res> {
  __$$ApartmentModelImplCopyWithImpl(
      _$ApartmentModelImpl _value, $Res Function(_$ApartmentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApartmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apartmentId = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? name = null,
    Object? location = null,
    Object? county = null,
    Object? subCounty = null,
    Object? ward = null,
    Object? description = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? coverImageUrl = freezed,
    Object? coverImage = freezed,
  }) {
    return _then(_$ApartmentModelImpl(
      apartmentId: null == apartmentId
          ? _value.apartmentId
          : apartmentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      county: null == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String,
      subCounty: null == subCounty
          ? _value.subCounty
          : subCounty // ignore: cast_nullable_to_non_nullable
              as String,
      ward: null == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApartmentModelImpl implements _ApartmentModel {
  const _$ApartmentModelImpl(
      {@JsonKey(name: "apartment_id", includeToJson: false)
      this.apartmentId = '',
      @JsonKey(name: "user_id") this.userId = '',
      @JsonKey(name: "created_at", includeToJson: false) this.createdAt = '',
      @JsonKey(name: "name") this.name = '',
      @JsonKey(name: "location") this.location = '',
      @JsonKey(name: "county") this.county = '',
      @JsonKey(name: "sub_county") this.subCounty = '',
      @JsonKey(name: "ward") this.ward = '',
      @JsonKey(name: "description") this.description = '',
      @JsonKey(name: "latitude") this.latitude = 0,
      @JsonKey(name: "longitude") this.longitude = 0,
      @JsonKey(name: "cover_image_url", includeToJson: false)
      this.coverImageUrl = null,
      @JsonKey(name: "coverImage", includeToJson: false, includeFromJson: false)
      this.coverImage = null});

  factory _$ApartmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApartmentModelImplFromJson(json);

  /// Primary Keys
  @override
  @JsonKey(name: "apartment_id", includeToJson: false)
  final String apartmentId;
  @override
  @JsonKey(name: "user_id")
  final String userId;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  final String createdAt;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "location")
  final String location;
  @override
  @JsonKey(name: "county")
  final String county;
  @override
  @JsonKey(name: "sub_county")
  final String subCounty;
  @override
  @JsonKey(name: "ward")
  final String ward;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "latitude")
  final double? latitude;
  @override
  @JsonKey(name: "longitude")
  final double? longitude;
  @override
  @JsonKey(name: "cover_image_url", includeToJson: false)
  final String? coverImageUrl;
  @override
  @JsonKey(name: "coverImage", includeToJson: false, includeFromJson: false)
  final XFile? coverImage;

  @override
  String toString() {
    return 'ApartmentModel(apartmentId: $apartmentId, userId: $userId, createdAt: $createdAt, name: $name, location: $location, county: $county, subCounty: $subCounty, ward: $ward, description: $description, latitude: $latitude, longitude: $longitude, coverImageUrl: $coverImageUrl, coverImage: $coverImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApartmentModelImpl &&
            (identical(other.apartmentId, apartmentId) ||
                other.apartmentId == apartmentId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.county, county) || other.county == county) &&
            (identical(other.subCounty, subCounty) ||
                other.subCounty == subCounty) &&
            (identical(other.ward, ward) || other.ward == ward) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      apartmentId,
      userId,
      createdAt,
      name,
      location,
      county,
      subCounty,
      ward,
      description,
      latitude,
      longitude,
      coverImageUrl,
      coverImage);

  /// Create a copy of ApartmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApartmentModelImplCopyWith<_$ApartmentModelImpl> get copyWith =>
      __$$ApartmentModelImplCopyWithImpl<_$ApartmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApartmentModelImplToJson(
      this,
    );
  }
}

abstract class _ApartmentModel implements ApartmentModel {
  const factory _ApartmentModel(
      {@JsonKey(name: "apartment_id", includeToJson: false)
      final String apartmentId,
      @JsonKey(name: "user_id") final String userId,
      @JsonKey(name: "created_at", includeToJson: false) final String createdAt,
      @JsonKey(name: "name") final String name,
      @JsonKey(name: "location") final String location,
      @JsonKey(name: "county") final String county,
      @JsonKey(name: "sub_county") final String subCounty,
      @JsonKey(name: "ward") final String ward,
      @JsonKey(name: "description") final String description,
      @JsonKey(name: "latitude") final double? latitude,
      @JsonKey(name: "longitude") final double? longitude,
      @JsonKey(name: "cover_image_url", includeToJson: false)
      final String? coverImageUrl,
      @JsonKey(name: "coverImage", includeToJson: false, includeFromJson: false)
      final XFile? coverImage}) = _$ApartmentModelImpl;

  factory _ApartmentModel.fromJson(Map<String, dynamic> json) =
      _$ApartmentModelImpl.fromJson;

  /// Primary Keys
  @override
  @JsonKey(name: "apartment_id", includeToJson: false)
  String get apartmentId;
  @override
  @JsonKey(name: "user_id")
  String get userId;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  String get createdAt;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "location")
  String get location;
  @override
  @JsonKey(name: "county")
  String get county;
  @override
  @JsonKey(name: "sub_county")
  String get subCounty;
  @override
  @JsonKey(name: "ward")
  String get ward;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "latitude")
  double? get latitude;
  @override
  @JsonKey(name: "longitude")
  double? get longitude;
  @override
  @JsonKey(name: "cover_image_url", includeToJson: false)
  String? get coverImageUrl;
  @override
  @JsonKey(name: "coverImage", includeToJson: false, includeFromJson: false)
  XFile? get coverImage;

  /// Create a copy of ApartmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApartmentModelImplCopyWith<_$ApartmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
