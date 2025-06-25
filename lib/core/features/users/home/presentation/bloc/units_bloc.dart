import 'package:bloc/bloc.dart';
import 'package:keja_hunt/core/data/repository/unit_repository.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:meta/meta.dart';

import '../../../../../di/locator.dart';

part 'units_event.dart';

part 'units_state.dart';

class UnitsBloc extends Bloc<UnitsEvent, UnitsState> {
  UnitsBloc() : super(UnitsInitial()) {
    on<FetchAllUnitsEvent>(_fetchAllUnits);
  }

  Future<void> _fetchAllUnits(
    FetchAllUnitsEvent event,
    Emitter<UnitsState> emit,
  ) async {
    emit(UnitsLoading());
    try {
      final userRepo = locator.get<UnitRepository>();

      await userRepo.fetchAllUnits().then((units) {
        emit(UnitsSuccess(allUnits: units));
      });
    } catch (e) {
      emit(UnitsFailed(errorMessage: "Could not fetch units: ${e.toString()}"));
    }
  }
}
