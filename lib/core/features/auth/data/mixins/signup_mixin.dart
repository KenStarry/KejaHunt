import 'package:keja_hunt/core/features/auth/domain/enums/user_type.dart';
import 'package:keja_hunt/core/features/auth/domain/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../di/locator.dart';
import '../../../../utils/supabase_constants.dart';

mixin SignUpMixin {
  final supabase = locator.get<SupabaseClient>();

  /// Sign Up User with Email and Password
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await supabase.auth.signUp(email: email, password: password).then((
      authResponse,
    ) async {
      /// Session == null means Confirmation email has been sent but not confirmed yet.
      /// User == null means the user has not been created yet.
      final Session? session = authResponse.session;
      final User? supabaseUser = authResponse.user;

      if (supabaseUser == null) {
        throw Exception("User creation failed. Please try again.");
      } else {
        final kejaUser = UserModel(
          id: supabaseUser.id,
          email: supabaseUser.email!,
          userType: UserType.user.name,
          createdAt: supabaseUser.createdAt,
          updatedAt: supabaseUser.createdAt,
          isVerifiedUser: false,
          isVerifiedAgent: false,
          username: '',
          fullName: '',
          phoneNumber: '',
          avatarUrl: '',
        );

        /// Create a new user in the database
        await supabase.from(USER_TABLE).insert(kejaUser.toJson());
      }
    });
  }
}
