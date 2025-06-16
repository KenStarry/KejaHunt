part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class FetchUserEvent extends AuthEvent {
  FetchUserEvent();
}

final class AuthCheckStatusEvent extends AuthEvent {}

final class AuthLoggedInEvent extends AuthEvent {}

final class AuthLoggedOutEvent extends AuthEvent {}
