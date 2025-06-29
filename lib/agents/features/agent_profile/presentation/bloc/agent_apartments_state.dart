part of 'agent_apartments_bloc.dart';

@immutable
sealed class AgentApartmentsState {}

final class AgentApartmentsInitial extends AgentApartmentsState {}
final class AgentApartmentsLoading extends AgentApartmentsState {}
final class AgentApartmentsSuccess extends AgentApartmentsState {
  final List<ApartmentModel> apartments;

  AgentApartmentsSuccess({required this.apartments});
}
final class AgentApartmentsFailed extends AgentApartmentsState {
  final String errorMessage;

  AgentApartmentsFailed({required this.errorMessage});
}
