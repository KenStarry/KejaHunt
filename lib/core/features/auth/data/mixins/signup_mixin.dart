import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../di/locator.dart';

mixin SignUpMixin {
  final supabase = locator.get<SupabaseClient>();

  /// Sign Up User with Email and Password
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final AuthResponse authResponse = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    /// Session == null means Confirmation email has been sent but not confirmed yet.
    /// User == null means the user has not been created yet.
    final Session? session = authResponse.session;
    final User? user = authResponse.user;

    if (user == null) {
      throw Exception("User creation failed. Please try again.");
    }
  }
}
