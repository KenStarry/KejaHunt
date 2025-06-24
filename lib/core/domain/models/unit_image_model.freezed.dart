// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnitImageModel _$UnitImageModelFromJson(Map<String, dynamic> json) {
  return _UnitImageModel.fromJson(json);
}

/// @nodoc
mixin _$UnitImageModel {
  @JsonKey(name: "image_id", includeToJson: false)
  int get imageId => throw _privateConstructorUsedError;
  @JsonKey(name: "uploaded_at", includeToJson: false)
  String get uploadedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "unit_id")
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "image_tag")
  String get imageTag => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  XFile? get imageFile => throw _privateConstructorUsedError;

  /// Serializes this UnitImageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnitImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnitImageModelCopyWith<UnitImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitImageModelCopyWith<$Res> {
  factory $UnitImageModelCopyWith(
          UnitImageModel value, $Res Function(UnitImageModel) then) =
      _$UnitImageModelCopyWithImpl<$Res, UnitImageModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "image_id", includeToJson: false) int imageId,
      @JsonKey(name: "uploaded_at", includeToJson: false) String uploadedAt,
      @JsonKey(name: "unit_id") String unitId,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "image_url") String imageUrl,
      @JsonKey(name: "image_tag") String imageTag,
      @JsonKey(includeToJson: false, includeFromJson: false) XFile? imageFile});
}

/// @nodoc
class _$UnitImageModelCopyWithImpl<$Res, $Val extends UnitImageModel>
    implements $UnitImageModelCopyWith<$Res> {
  _$UnitImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnitImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = null,
    Object? uploadedAt = null,
    Object? unitId = null,
    Object? userId = null,
    Object? imageUrl = null,
    Object? imageTag = null,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageTag: null == imageTag
          ? _value.imageTag
          : imageTag // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnitImageModelImplCopyWith<$Res>
    implements $UnitImageModelCopyWith<$Res> {
  factory _$$UnitImageModelImplCopyWith(_$UnitImageModelImpl value,
          $Res Function(_$UnitImageModelImpl) then) =
      __$$UnitImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "image_id", includeToJson: false) int imageId,
      @JsonKey(name: "uploaded_at", includeToJson: false) String uploadedAt,
      @JsonKey(name: "unit_id") String unitId,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "image_url") String imageUrl,
      @JsonKey(name: "image_tag") String imageTag,
      @JsonKey(includeToJson: false, includeFromJson: false) XFile? imageFile});
}

/// @nodoc
class __$$UnitImageModelImplCopyWithImpl<$Res>
    extends _$UnitImageModelCopyWithImpl<$Res, _$UnitImageModelImpl>
    implements _$$UnitImageModelImplCopyWith<$Res> {
  __$$UnitImageModelImplCopyWithImpl(
      _$UnitImageModelImpl _value, $Res Function(_$UnitImageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnitImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = null,
    Object? uploadedAt = null,
    Object? unitId = null,
    Object? userId = null,
    Object? imageUrl = null,
    Object? imageTag = null,
    Object? imageFile = freezed,
  }) {
    return _then(_$UnitImageModelImpl(
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageTag: null == imageTag
          ? _value.imageTag
          : imageTag // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnitImageModelImpl implements _UnitImageModel {
  const _$UnitImageModelImpl(
      {@JsonKey(name: "image_id", includeToJson: false) this.imageId = 0,
      @JsonKey(name: "uploaded_at", includeToJson: false) this.uploadedAt = '',
      @JsonKey(name: "unit_id") this.unitId = '',
      @JsonKey(name: "user_id") this.userId = '',
      @JsonKey(name: "image_url") this.imageUrl = '',
      @JsonKey(name: "image_tag") this.imageTag = '',
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.imageFile = null});

  factory _$UnitImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitImageModelImplFromJson(json);

  @override
  @JsonKey(name: "image_id", includeToJson: false)
  final int imageId;
  @override
  @JsonKey(name: "uploaded_at", includeToJson: false)
  final String uploadedAt;
  @override
  @JsonKey(name: "unit_id")
  final String unitId;
  @override
  @JsonKey(name: "user_id")
  final String userId;
  @override
  @JsonKey(name: "image_url")
  final String imageUrl;
  @override
  @JsonKey(name: "image_tag")
  final String imageTag;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final XFile? imageFile;

  @override
  String toString() {
    return 'UnitImageModel(imageId: $imageId, uploadedAt: $uploadedAt, unitId: $unitId, userId: $userId, imageUrl: $imageUrl, imageTag: $imageTag, imageFile: $imageFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitImageModelImpl &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageTag, imageTag) ||
                other.imageTag == imageTag) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageId, uploadedAt, unitId,
      userId, imageUrl, imageTag, imageFile);

  /// Create a copy of UnitImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitImageModelImplCopyWith<_$UnitImageModelImpl> get copyWith =>
      __$$UnitImageModelImplCopyWithImpl<_$UnitImageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitImageModelImplToJson(
      this,
    );
  }
}

abstract class _UnitImageModel implements UnitImageModel {
  const factory _UnitImageModel(
      {@JsonKey(name: "image_id", includeToJson: false) final int imageId,
      @JsonKey(name: "uploaded_at", includeToJson: false)
      final String uploadedAt,
      @JsonKey(name: "unit_id") final String unitId,
      @JsonKey(name: "user_id") final String userId,
      @JsonKey(name: "image_url") final String imageUrl,
      @JsonKey(name: "image_tag") final String imageTag,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final XFile? imageFile}) = _$UnitImageModelImpl;

  factory _UnitImageModel.fromJson(Map<String, dynamic> json) =
      _$UnitImageModelImpl.fromJson;

  @override
  @JsonKey(name: "image_id", includeToJson: false)
  int get imageId;
  @override
  @JsonKey(name: "uploaded_at", includeToJson: false)
  String get uploadedAt;
  @override
  @JsonKey(name: "unit_id")
  String get unitId;
  @override
  @JsonKey(name: "user_id")
  String get userId;
  @override
  @JsonKey(name: "image_url")
  String get imageUrl;
  @override
  @JsonKey(name: "image_tag")
  String get imageTag;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  XFile? get imageFile;

  /// Create a copy of UnitImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnitImageModelImplCopyWith<_$UnitImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
