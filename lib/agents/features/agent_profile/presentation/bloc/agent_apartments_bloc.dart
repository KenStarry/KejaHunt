import 'package:bloc/bloc.dart';
import 'package:keja_hunt/core/data/repository/unit_repository.dart';
import 'package:keja_hunt/core/domain/models/apartment/apartment_model.dart';
import 'package:meta/meta.dart';

import '../../../../../core/di/locator.dart';

part 'agent_apartments_event.dart';

part 'agent_apartments_state.dart';

class AgentApartmentsBloc
    extends Bloc<AgentApartmentsEvent, AgentApartmentsState> {
  AgentApartmentsBloc() : super(AgentApartmentsInitial()) {
    on<FetchAgentApartmentsEvent>(_onFetchAgentApartmentsEvent);
  }

  Future<void> _onFetchAgentApartmentsEvent(
    FetchAgentApartmentsEvent event,
    Emitter<AgentApartmentsState> emit,
  ) async {
    emit(AgentApartmentsLoading());
    try {
      final unitRepo = locator.get<UnitRepository>();

      await unitRepo.fetchAgentApartments(agentId: event.agentId).then((
        apartments,
      ) {
        emit(AgentApartmentsSuccess(apartments: apartments));
      });
    } catch (e) {
      emit(
        AgentApartmentsFailed(
          errorMessage: "Uploading unit failed: ${e.toString()}",
        ),
      );
    }
  }
}
