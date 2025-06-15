part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginWithEmailEvent extends LoginEvent {
  final String email;
  final String password;

  LoginWithEmailEvent({required this.email, required this.password});
}

final class LoginWithGoogleEvent extends LoginEvent {
  LoginWithGoogleEvent();
}
