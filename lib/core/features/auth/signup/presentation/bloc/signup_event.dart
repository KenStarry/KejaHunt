part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class SignupSubmittedEvent extends SignupEvent {
  final String email;
  final String password;

  SignupSubmittedEvent({
    required this.email,
    required this.password,
  });
}
