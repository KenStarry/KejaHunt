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

    /// Check if the user is an agent
    final data = await supabase
        .from(USER_TABLE)
        .select('*, agents(user_id)')
        .eq('user_id', user.id)
        .maybeSingle();

    final agentData = await supabase
        .from('agents')
        .select()
        .eq('user_id', user.id)
        .maybeSingle();

    final isAgent = agentData != null;

    final userModel = UserModel.fromJson(
      userResponse,
    ).copyWith(isAgent: isAgent);

    return userModel;
  }

  Future<void> upgradeUserToAgent() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in');
    }

    await supabase.from(AGENTS_TABLE).insert({"user_id": user.id});
  }
}
