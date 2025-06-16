import 'package:bloc/bloc.dart';
import 'package:keja_hunt/core/features/auth/domain/models/user_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../di/locator.dart';
import '../../data/repository/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    final supabase = locator.get<SupabaseClient>();

    on<AuthCheckStatusEvent>(_onAuthCheckStatus);
    on<AuthLoggedInEvent>(_onLoggedIn);
    on<AuthLoggedOutEvent>(_onLoggedOut);
    on<AuthSignOutEvent>(_signOut);

    /// Listen to Auth State Changes
    supabase.auth.onAuthStateChange.listen((data) {
      final session = data.session;

      if (session?.user != null) {
        add(AuthLoggedInEvent());
      } else {
        add(AuthLoggedOutEvent());
      }
    });
  }


  void _onAuthCheckStatus(AuthCheckStatusEvent event, Emitter<AuthState> emit) {
    final supabase = locator.get<SupabaseClient>();

    final user = supabase.auth.currentUser;

    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  void _onLoggedIn(AuthLoggedInEvent event, Emitter<AuthState> emit) {
    final supabase = locator.get<SupabaseClient>();

    final user = supabase.auth.currentUser;

    if (user != null) {
      emit(Authenticated(user));
    }
  }

  void _onLoggedOut(AuthLoggedOutEvent event, Emitter<AuthState> emit) {
    emit(Unauthenticated());
  }

  Future<void> _signOut(AuthSignOutEvent event, Emitter<AuthState> emit) async {
    final authRepo = locator.get<AuthRepository>();

    await authRepo.signOut();
  }
}
