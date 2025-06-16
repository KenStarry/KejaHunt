import 'package:bloc/bloc.dart';
import 'package:keja_hunt/core/features/auth/domain/models/user_model.dart';
import 'package:keja_hunt/users/features/dashboard/data/repository/dashboard_repository.dart';
import 'package:meta/meta.dart';

import '../../../../../core/di/locator.dart';
import '../../../../../core/features/auth/data/repository/auth_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUserEvent>(_onFetchUserEvent);
    on<ClearUserEvent>(_onClearUser);
  }

  Future<void> _onFetchUserEvent(
    FetchUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final dashboardRepo = locator.get<DashboardRepository>();

      await dashboardRepo.fetchCurrentUser().then((user) {
        emit(UserSuccess(user: user));
      });
    } catch (e) {
      emit(UserFailed(errorMessage: "Login failed: ${e.toString()}"));
    }
  }

  void _onClearUser(ClearUserEvent event, Emitter<UserState> emit) {
    emit(UserInitial());
  }
}
