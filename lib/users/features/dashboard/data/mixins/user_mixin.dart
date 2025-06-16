import 'package:keja_hunt/core/di/locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/features/auth/domain/models/user_model.dart';
import '../../../../../core/utils/supabase_constants.dart';

mixin UserMixin {

  final supabase = locator.get<SupabaseClient>();

  Future<UserModel> fetchCurrentUser() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in');
    }

    final userResponse = await supabase
        .from(USER_TABLE)
        .select()
        .eq('id', user.id)
        .single();

    return UserModel.fromJson(userResponse);
  }
}