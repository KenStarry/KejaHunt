// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['user_id'] as String,
      email: json['email'] as String,
      createdAt: json['created_at'] as String?,
      username: json['username'] as String?,
      fullName: json['full_name'] as String?,
      phoneNumber: json['phone'] as String?,
      userType: json['user_type'] as String?,
      isVerifiedUser: json['is_verified_user'] as bool? ?? false,
      isVerifiedAgent: json['is_verified_agent'] as bool? ?? false,
      avatarUrl: json['avatar_url'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'email': instance.email,
      'created_at': instance.createdAt,
      'username': instance.username,
      'full_name': instance.fullName,
      'phone': instance.phoneNumber,
      'user_type': instance.userType,
      'is_verified_user': instance.isVerifiedUser,
      'is_verified_agent': instance.isVerifiedAgent,
      'avatar_url': instance.avatarUrl,
      'updated_at': instance.updatedAt,
    };
