part of 'agent_apartments_bloc.dart';

@immutable
sealed class AgentApartmentsEvent {}

final class FetchAgentApartmentsEvent extends AgentApartmentsEvent {
  final String agentId;

  FetchAgentApartmentsEvent({required this.agentId});
}
