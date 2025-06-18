part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class FetchUserEvent extends UserEvent {}

final class UpgradeUserToAgentEvent extends UserEvent {}

final class ClearUserEvent extends UserEvent {}
