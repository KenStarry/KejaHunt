import 'package:bloc/bloc.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/domain/use_cases/agent_use_cases.dart';
import 'package:meta/meta.dart';

import '../../../../../di/locator.dart';

part 'upload_unit_event.dart';

part 'upload_unit_state.dart';

class UploadUnitBloc extends Bloc<UploadUnitEvent, UploadUnitState> {
  UploadUnitBloc() : super(UploadUnitInitial()) {
    on<HouseUnitUploadEvent>(_onHouseUploadEvent);
  }

  Future<void> _onHouseUploadEvent(
    HouseUnitUploadEvent event,
    Emitter<UploadUnitState> emit,
  ) async {
    emit(UploadUnitLoading());
    try {
      final agentUseCases = locator.get<AgentUseCases>();

      await agentUseCases.uploadUnitCase
          .call(houseUnitModel: event.houseUnitModel)
          .then((_) {
            emit(UploadUnitSuccess());
          });
    } catch (e) {
      emit(UploadUnitFailure(errorMessage: "Uploading unit failed: ${e.toString()}"));
    }
  }
}
