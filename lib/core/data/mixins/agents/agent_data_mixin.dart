import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../di/locator.dart';
import '../../../features/auth/domain/models/user_model.dart';
import '../../../utils/supabase_constants.dart';

mixin AgentDataMixin {
  final supabase = locator.get<SupabaseClient>();

  Future<List<UserModel>> fetchAllAgents() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in');
    }
    return [];
  }
}
