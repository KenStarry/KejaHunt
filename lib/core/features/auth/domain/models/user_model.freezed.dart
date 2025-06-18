// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: "user_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phoneNumber => throw _privateConstructorUsedError;

  /// Agent, User, Landlord, Admin, etc.
  @JsonKey(name: "user_type")
  String? get userType => throw _privateConstructorUsedError;
  @JsonKey(name: "is_verified_user")
  bool? get isVerifiedUser => throw _privateConstructorUsedError;
  @JsonKey(name: "is_verified_agent")
  bool? get isVerifiedAgent => throw _privateConstructorUsedError;
  @JsonKey(name: "avatar_url")
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") String id,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "username") String? username,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "phone") String? phoneNumber,
      @JsonKey(name: "user_type") String? userType,
      @JsonKey(name: "is_verified_user") bool? isVerifiedUser,
      @JsonKey(name: "is_verified_agent") bool? isVerifiedAgent,
      @JsonKey(name: "avatar_url") String? avatarUrl,
      @JsonKey(name: "updated_at") String? updatedAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? createdAt = freezed,
    Object? username = freezed,
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? userType = freezed,
    Object? isVerifiedUser = freezed,
    Object? isVerifiedAgent = freezed,
    Object? avatarUrl = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerifiedUser: freezed == isVerifiedUser
          ? _value.isVerifiedUser
          : isVerifiedUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerifiedAgent: freezed == isVerifiedAgent
          ? _value.isVerifiedAgent
          : isVerifiedAgent // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") String id,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "username") String? username,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "phone") String? phoneNumber,
      @JsonKey(name: "user_type") String? userType,
      @JsonKey(name: "is_verified_user") bool? isVerifiedUser,
      @JsonKey(name: "is_verified_agent") bool? isVerifiedAgent,
      @JsonKey(name: "avatar_url") String? avatarUrl,
      @JsonKey(name: "updated_at") String? updatedAt});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? createdAt = freezed,
    Object? username = freezed,
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? userType = freezed,
    Object? isVerifiedUser = freezed,
    Object? isVerifiedAgent = freezed,
    Object? avatarUrl = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerifiedUser: freezed == isVerifiedUser
          ? _value.isVerifiedUser
          : isVerifiedUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerifiedAgent: freezed == isVerifiedAgent
          ? _value.isVerifiedAgent
          : isVerifiedAgent // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(name: "user_id") required this.id,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "username") this.username,
      @JsonKey(name: "full_name") this.fullName,
      @JsonKey(name: "phone") this.phoneNumber,
      @JsonKey(name: "user_type") this.userType,
      @JsonKey(name: "is_verified_user") this.isVerifiedUser = false,
      @JsonKey(name: "is_verified_agent") this.isVerifiedAgent = false,
      @JsonKey(name: "avatar_url") this.avatarUrl,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: "user_id")
  final String id;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "username")
  final String? username;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  @JsonKey(name: "phone")
  final String? phoneNumber;

  /// Agent, User, Landlord, Admin, etc.
  @override
  @JsonKey(name: "user_type")
  final String? userType;
  @override
  @JsonKey(name: "is_verified_user")
  final bool? isVerifiedUser;
  @override
  @JsonKey(name: "is_verified_agent")
  final bool? isVerifiedAgent;
  @override
  @JsonKey(name: "avatar_url")
  final String? avatarUrl;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, createdAt: $createdAt, username: $username, fullName: $fullName, phoneNumber: $phoneNumber, userType: $userType, isVerifiedUser: $isVerifiedUser, isVerifiedAgent: $isVerifiedAgent, avatarUrl: $avatarUrl, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.isVerifiedUser, isVerifiedUser) ||
                other.isVerifiedUser == isVerifiedUser) &&
            (identical(other.isVerifiedAgent, isVerifiedAgent) ||
                other.isVerifiedAgent == isVerifiedAgent) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      createdAt,
      username,
      fullName,
      phoneNumber,
      userType,
      isVerifiedUser,
      isVerifiedAgent,
      avatarUrl,
      updatedAt);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: "user_id") required final String id,
      @JsonKey(name: "email") required final String email,
      @JsonKey(name: "created_at") final String? createdAt,
      @JsonKey(name: "username") final String? username,
      @JsonKey(name: "full_name") final String? fullName,
      @JsonKey(name: "phone") final String? phoneNumber,
      @JsonKey(name: "user_type") final String? userType,
      @JsonKey(name: "is_verified_user") final bool? isVerifiedUser,
      @JsonKey(name: "is_verified_agent") final bool? isVerifiedAgent,
      @JsonKey(name: "avatar_url") final String? avatarUrl,
      @JsonKey(name: "updated_at") final String? updatedAt}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: "user_id")
  String get id;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "username")
  String? get username;
  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  @JsonKey(name: "phone")
  String? get phoneNumber;

  /// Agent, User, Landlord, Admin, etc.
  @override
  @JsonKey(name: "user_type")
  String? get userType;
  @override
  @JsonKey(name: "is_verified_user")
  bool? get isVerifiedUser;
  @override
  @JsonKey(name: "is_verified_agent")
  bool? get isVerifiedAgent;
  @override
  @JsonKey(name: "avatar_url")
  String? get avatarUrl;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
