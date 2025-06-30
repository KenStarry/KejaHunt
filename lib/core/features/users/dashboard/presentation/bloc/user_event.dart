part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class FetchUserEvent extends UserEvent {
  final String? userId;

  FetchUserEvent({this.userId});
}

final class UpgradeUserToAgentEvent extends UserEvent {
  final String? userId;

  UpgradeUserToAgentEvent({this.userId});
}

final class ClearUserEvent extends UserEvent {}
