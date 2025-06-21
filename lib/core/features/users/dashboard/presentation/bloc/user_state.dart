part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final UserModel? user;

  UserSuccess({required this.user});
}

final class UserFailed extends UserState {
  final String errorMessage;

  UserFailed({required this.errorMessage});
}
