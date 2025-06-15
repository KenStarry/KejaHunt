import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../di/locator.dart';
import '../../../data/repository/auth_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginWithEmailEvent>(_onLoginSubmitted);
    on<LoginWithGoogleEvent>(_onLoginWithGoogleSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginWithEmailEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final authRepo = locator.get<AuthRepository>();

      await authRepo
          .signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          )
          .then((_) {
            emit(LoginSuccess("Login successful!"));
          });
    } catch (e) {
      emit(LoginFailure("Login failed: ${e.toString()}"));
    }
  }

  Future<void> _onLoginWithGoogleSubmitted(
    LoginWithGoogleEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final authRepo = locator.get<AuthRepository>();

      await authRepo.signUpWithGoogle().then((_) {
        emit(LoginSuccess("Login with Google successful!"));
      });
    } catch (e) {
      emit(LoginFailure("Login failed: ${e.toString()}"));
    }
  }
}
