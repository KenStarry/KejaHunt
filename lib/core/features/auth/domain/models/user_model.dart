import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "user_id") required String id,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "phone") String? phoneNumber,

    /// Agent, User, Landlord, Admin, etc.
    @JsonKey(name: "user_type") String? userType,

    @JsonKey(name: "is_verified_user") @Default(false) bool? isVerifiedUser,
    @JsonKey(name: "is_verified_agent") @Default(false) bool? isVerifiedAgent,

    @JsonKey(name: "avatar_url") String? avatarUrl,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
