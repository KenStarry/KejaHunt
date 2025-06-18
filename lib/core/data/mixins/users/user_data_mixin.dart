import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../di/locator.dart';
import '../../../features/auth/domain/models/user_model.dart';
import '../../../utils/supabase_constants.dart';

mixin UserDataMixin {
  final supabase = locator.get<SupabaseClient>();

  Future<UserModel> fetchUser() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in');
    }

    final userResponse = await supabase
        .from(USER_TABLE)
        .select()
        .eq('user_id', user.id)
        .single();

    return UserModel.fromJson(userResponse);
  }
}