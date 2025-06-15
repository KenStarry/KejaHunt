part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class SignupWithEmailEvent extends SignupEvent {
  final String email;
  final String password;

  SignupWithEmailEvent({required this.email, required this.password});
}

final class SignupWithGoogleEvent extends SignupEvent {
  SignupWithGoogleEvent();
}
