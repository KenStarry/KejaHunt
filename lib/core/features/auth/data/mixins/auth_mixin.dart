import 'package:keja_hunt/core/features/auth/domain/models/user_model.dart';
import 'package:keja_hunt/core/utils/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../di/locator.dart';

mixin AuthMixin {
  final supabase = locator.get<SupabaseClient>();

  Future<void> signOut() async => await supabase.auth.signOut();
}
