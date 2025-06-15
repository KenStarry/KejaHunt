import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../di/locator.dart';
import '../../domain/models/user_model.dart';

mixin LoginMixin {
  final supabase = locator.get<SupabaseClient>();

  /// Sign In User with Email and Password
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await supabase.auth
        .signInWithPassword(email: email, password: password)
        .then((authResponse) async {
          final Session? session = authResponse.session;
          final User? supabaseUser = authResponse.user;

          if (supabaseUser == null) {
            throw Exception("User creation failed. Please try again.");
          }
        });
  }
}
