// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentModelImpl _$$AgentModelImplFromJson(Map<String, dynamic> json) =>
    _$AgentModelImpl(
      userId: json['user_id'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      agencyName: json['agency_name'] as String? ?? '',
      isVerified: json['is_verified'] as bool? ?? false,
      accountBalance: (json['account_balance'] as num?)?.toDouble() ?? 0.00,
    );

Map<String, dynamic> _$$AgentModelImplToJson(_$AgentModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'agency_name': instance.agencyName,
      'is_verified': instance.isVerified,
      'account_balance': instance.accountBalance,
    };
