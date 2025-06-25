// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnitReviewModel _$UnitReviewModelFromJson(Map<String, dynamic> json) {
  return _UnitReviewModel.fromJson(json);
}

/// @nodoc
mixin _$UnitReviewModel {
  @JsonKey(name: "id", includeToJson: false)
  int get imageId => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at", includeToJson: false)
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at", includeToJson: false)
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "unit_id")
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  double? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "review_message")
  String get reviewMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviewer', includeToJson: false, includeFromJson: true)
  UserModel? get userWhoReviewed => throw _privateConstructorUsedError;

  /// Serializes this UnitReviewModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnitReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnitReviewModelCopyWith<UnitReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitReviewModelCopyWith<$Res> {
  factory $UnitReviewModelCopyWith(
          UnitReviewModel value, $Res Function(UnitReviewModel) then) =
      _$UnitReviewModelCopyWithImpl<$Res, UnitReviewModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id", includeToJson: false) int imageId,
      @JsonKey(name: "created_at", includeToJson: false) String createdAt,
      @JsonKey(name: "updated_at", includeToJson: false) String updatedAt,
      @JsonKey(name: "unit_id") String unitId,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "rating") double? rating,
      @JsonKey(name: "review_message") String reviewMessage,
      @JsonKey(name: 'reviewer', includeToJson: false, includeFromJson: true)
      UserModel? userWhoReviewed});

  $UserModelCopyWith<$Res>? get userWhoReviewed;
}

/// @nodoc
class _$UnitReviewModelCopyWithImpl<$Res, $Val extends UnitReviewModel>
    implements $UnitReviewModelCopyWith<$Res> {
  _$UnitReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnitReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? unitId = null,
    Object? userId = null,
    Object? rating = freezed,
    Object? reviewMessage = null,
    Object? userWhoReviewed = freezed,
  }) {
    return _then(_value.copyWith(
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewMessage: null == reviewMessage
          ? _value.reviewMessage
          : reviewMessage // ignore: cast_nullable_to_non_nullable
              as String,
      userWhoReviewed: freezed == userWhoReviewed
          ? _value.userWhoReviewed
          : userWhoReviewed // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  /// Create a copy of UnitReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get userWhoReviewed {
    if (_value.userWhoReviewed == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userWhoReviewed!, (value) {
      return _then(_value.copyWith(userWhoReviewed: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UnitReviewModelImplCopyWith<$Res>
    implements $UnitReviewModelCopyWith<$Res> {
  factory _$$UnitReviewModelImplCopyWith(_$UnitReviewModelImpl value,
          $Res Function(_$UnitReviewModelImpl) then) =
      __$$UnitReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id", includeToJson: false) int imageId,
      @JsonKey(name: "created_at", includeToJson: false) String createdAt,
      @JsonKey(name: "updated_at", includeToJson: false) String updatedAt,
      @JsonKey(name: "unit_id") String unitId,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "rating") double? rating,
      @JsonKey(name: "review_message") String reviewMessage,
      @JsonKey(name: 'reviewer', includeToJson: false, includeFromJson: true)
      UserModel? userWhoReviewed});

  @override
  $UserModelCopyWith<$Res>? get userWhoReviewed;
}

/// @nodoc
class __$$UnitReviewModelImplCopyWithImpl<$Res>
    extends _$UnitReviewModelCopyWithImpl<$Res, _$UnitReviewModelImpl>
    implements _$$UnitReviewModelImplCopyWith<$Res> {
  __$$UnitReviewModelImplCopyWithImpl(
      _$UnitReviewModelImpl _value, $Res Function(_$UnitReviewModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnitReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? unitId = null,
    Object? userId = null,
    Object? rating = freezed,
    Object? reviewMessage = null,
    Object? userWhoReviewed = freezed,
  }) {
    return _then(_$UnitReviewModelImpl(
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewMessage: null == reviewMessage
          ? _value.reviewMessage
          : reviewMessage // ignore: cast_nullable_to_non_nullable
              as String,
      userWhoReviewed: freezed == userWhoReviewed
          ? _value.userWhoReviewed
          : userWhoReviewed // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnitReviewModelImpl implements _UnitReviewModel {
  const _$UnitReviewModelImpl(
      {@JsonKey(name: "id", includeToJson: false) this.imageId = 0,
      @JsonKey(name: "created_at", includeToJson: false) this.createdAt = '',
      @JsonKey(name: "updated_at", includeToJson: false) this.updatedAt = '',
      @JsonKey(name: "unit_id") this.unitId = '',
      @JsonKey(name: "user_id") this.userId = '',
      @JsonKey(name: "rating") this.rating = null,
      @JsonKey(name: "review_message") this.reviewMessage = '',
      @JsonKey(name: 'reviewer', includeToJson: false, includeFromJson: true)
      this.userWhoReviewed = null});

  factory _$UnitReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitReviewModelImplFromJson(json);

  @override
  @JsonKey(name: "id", includeToJson: false)
  final int imageId;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  final String createdAt;
  @override
  @JsonKey(name: "updated_at", includeToJson: false)
  final String updatedAt;
  @override
  @JsonKey(name: "unit_id")
  final String unitId;
  @override
  @JsonKey(name: "user_id")
  final String userId;
  @override
  @JsonKey(name: "rating")
  final double? rating;
  @override
  @JsonKey(name: "review_message")
  final String reviewMessage;
  @override
  @JsonKey(name: 'reviewer', includeToJson: false, includeFromJson: true)
  final UserModel? userWhoReviewed;

  @override
  String toString() {
    return 'UnitReviewModel(imageId: $imageId, createdAt: $createdAt, updatedAt: $updatedAt, unitId: $unitId, userId: $userId, rating: $rating, reviewMessage: $reviewMessage, userWhoReviewed: $userWhoReviewed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitReviewModelImpl &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewMessage, reviewMessage) ||
                other.reviewMessage == reviewMessage) &&
            (identical(other.userWhoReviewed, userWhoReviewed) ||
                other.userWhoReviewed == userWhoReviewed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageId, createdAt, updatedAt,
      unitId, userId, rating, reviewMessage, userWhoReviewed);

  /// Create a copy of UnitReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitReviewModelImplCopyWith<_$UnitReviewModelImpl> get copyWith =>
      __$$UnitReviewModelImplCopyWithImpl<_$UnitReviewModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitReviewModelImplToJson(
      this,
    );
  }
}

abstract class _UnitReviewModel implements UnitReviewModel {
  const factory _UnitReviewModel(
      {@JsonKey(name: "id", includeToJson: false) final int imageId,
      @JsonKey(name: "created_at", includeToJson: false) final String createdAt,
      @JsonKey(name: "updated_at", includeToJson: false) final String updatedAt,
      @JsonKey(name: "unit_id") final String unitId,
      @JsonKey(name: "user_id") final String userId,
      @JsonKey(name: "rating") final double? rating,
      @JsonKey(name: "review_message") final String reviewMessage,
      @JsonKey(name: 'reviewer', includeToJson: false, includeFromJson: true)
      final UserModel? userWhoReviewed}) = _$UnitReviewModelImpl;

  factory _UnitReviewModel.fromJson(Map<String, dynamic> json) =
      _$UnitReviewModelImpl.fromJson;

  @override
  @JsonKey(name: "id", includeToJson: false)
  int get imageId;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  String get createdAt;
  @override
  @JsonKey(name: "updated_at", includeToJson: false)
  String get updatedAt;
  @override
  @JsonKey(name: "unit_id")
  String get unitId;
  @override
  @JsonKey(name: "user_id")
  String get userId;
  @override
  @JsonKey(name: "rating")
  double? get rating;
  @override
  @JsonKey(name: "review_message")
  String get reviewMessage;
  @override
  @JsonKey(name: 'reviewer', includeToJson: false, includeFromJson: true)
  UserModel? get userWhoReviewed;

  /// Create a copy of UnitReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnitReviewModelImplCopyWith<_$UnitReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
