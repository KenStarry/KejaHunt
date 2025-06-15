import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../di/locator.dart';
import '../../../data/repository/auth_repository.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupWithEmailEvent>(_onSignupSubmitted);
    on<SignupWithGoogleEvent>(_onSignupWithGoogleSubmitted);
  }

  Future<void> _onSignupSubmitted(
    SignupWithEmailEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    try {
      final authRepo = locator.get<AuthRepository>();

      await authRepo
          .signUpWithEmailAndPassword(
            email: event.email,
            password: event.password,
          )
          .then((_) {
            emit(SignupSuccess("Time to hunt! Let's goo"));
          });
    } catch (e) {
      emit(SignupFailure("Signup failed: ${e.toString()}"));
    }
  }

  Future<void> _onSignupWithGoogleSubmitted(
    SignupWithGoogleEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    try {
      final authRepo = locator.get<AuthRepository>();

      await authRepo.signUpWithGoogle().then((_) {
        emit(SignupSuccess("Time to hunt! Let's goo"));
      });
    } catch (e) {
      emit(SignupFailure("Signup failed: ${e.toString()}"));
    }
  }
}
