import 'package:bloc/bloc.dart';
import 'package:keja_hunt/core/domain/models/apartment/apartment_model.dart';
import 'package:meta/meta.dart';

import '../../../../../core/di/locator.dart';
import '../../../../../core/features/agents/agent_unit_upload/domain/use_cases/agent_use_cases.dart';

part 'upload_apartment_event.dart';

part 'upload_apartment_state.dart';

class UploadApartmentBloc
    extends Bloc<UploadApartmentEvent, UploadApartmentState> {
  UploadApartmentBloc() : super(UploadApartmentInitial()) {
    on<ApartmentUploadEvent>(_onApartmentUploadEvent);
  }

  Future<void> _onApartmentUploadEvent(
    ApartmentUploadEvent event,
    Emitter<UploadApartmentState> emit,
  ) async {
    emit(UploadApartmentLoading());
    try {
      final agentUseCases = locator.get<AgentUseCases>();

      await agentUseCases.uploadApartmentCase
          .call(apartmentModel: event.apartmentModel)
          .then((_) {
            emit(UploadApartmentSuccess());
          });
    } catch (e) {
      emit(
        UploadApartmentFailed(
          errorMessage: "Uploading unit failed: ${e.toString()}",
        ),
      );
    }
  }
}
