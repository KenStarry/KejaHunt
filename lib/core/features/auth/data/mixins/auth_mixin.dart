import 'package:keja_hunt/core/features/auth/domain/models/user_model.dart';
import 'package:keja_hunt/core/utils/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../di/locator.dart';

mixin AuthMixin {
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
