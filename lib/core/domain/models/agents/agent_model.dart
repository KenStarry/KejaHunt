import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_price_frequency_enum.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/domain/models/unit_image_model.dart';
import 'package:keja_hunt/core/utils/supabase_constants.dart';

part 'agent_model.freezed.dart';

part 'agent_model.g.dart';

@freezed
class AgentModel with _$AgentModel {
  const factory AgentModel({

    @JsonKey(name: "user_id") @Default('') String userId,
    @JsonKey(name: "created_at", includeToJson: false) @Default('') String createdAt,
    @JsonKey(name: "agency_name") @Default('') String agencyName,
    @JsonKey(name: "is_verified") @Default(false) bool isVerified,
    @JsonKey(name: "account_balance") @Default(0.00) double accountBalance,

  }) = _AgentModel;

  factory AgentModel.fromJson(Map<String, dynamic> json) =>
      _$AgentModelFromJson(json);
}
