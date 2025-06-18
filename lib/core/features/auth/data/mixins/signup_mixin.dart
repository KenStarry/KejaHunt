import 'package:google_sign_in/google_sign_in.dart';
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
          avatarUrl: "https://api.dicebear.com/7.x/adventurer/svg?seed=${supabaseUser.email!}",
        );

        /// Create a new user in the database
        await supabase
            .from(USER_TABLE)
            .upsert(
              kejaUser.toJson(),
              onConflict: 'user_id',
              ignoreDuplicates: false,
            )
            .select();
      }
    });
  }

  Future<void> signUpWithGoogle() async {
    // const iosClientId = 'my-ios.apps.googleusercontent.com';
    final GoogleSignIn googleSignIn = GoogleSignIn(
      // clientId: iosClientId,
      serverClientId:
          "985309959982-8a35sojdc2n34b4kmpicfqm1pur4505c.apps.googleusercontent.com",
    );

    await googleSignIn.signOut(); // Sign out any previous session

    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }
    await supabase.auth
        .signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
          accessToken: accessToken,
        )
        .then((authResponse) async {
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
              isVerifiedUser:
                  supabaseUser.userMetadata?['email_verified'] ?? false,
              isVerifiedAgent: false,
              username: supabaseUser.userMetadata?['name'] ?? '',
              fullName: supabaseUser.userMetadata?['full_name'] ?? '',
              phoneNumber: '',
              avatarUrl: supabaseUser.userMetadata?['avatar_url'] ?? '',
            );

            /// Create a new user in the database
            await supabase
                .from(USER_TABLE)
                .upsert(
                  kejaUser.toJson(),
                  onConflict: 'user_id',
                  ignoreDuplicates: false,
                )
                .select();
          }
        });
  }
}
