part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {
  final User supabaseUser;

  Authenticated(this.supabaseUser);
}

final class Unauthenticated extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserModel user;

  AuthSuccess(this.user);
}

final class AuthFailed extends AuthState {
  final String? errorMessage;

  AuthFailed({this.errorMessage});
}
