import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../di/locator.dart';
import '../../../features/auth/domain/models/user_model.dart';
import '../../../utils/supabase_constants.dart';

mixin UserDataMixin {
  final supabase = locator.get<SupabaseClient>();

  Future<UserModel?> fetchUserById() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in');
    }

    final userResponse = await supabase
        .from(usersTable)
        .select()
        .eq('user_id', user.id)
        .maybeSingle();

    /// Check if the user is an agent
    final agentData = await supabase
        .from('agents')
        .select()
        .eq('user_id', user.id)
        .maybeSingle();

    final userModel = userResponse == null
        ? null
        : UserModel.fromJson(userResponse).copyWith(isAgent: agentData != null);

    return userModel;
  }

  Future<void> upgradeUserToAgent() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in');
    }

    await supabase.from(agentsTable).insert({"user_id": user.id});
  }
}
