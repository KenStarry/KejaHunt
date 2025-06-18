import 'package:bloc/bloc.dart';
import 'package:keja_hunt/core/data/repository/user_repository.dart';
import 'package:keja_hunt/core/features/auth/domain/models/user_model.dart';
import 'package:keja_hunt/core/features/users/dashboard/data/repository/dashboard_repository.dart';
import 'package:meta/meta.dart';

import '../../../../../di/locator.dart';
import '../../../../auth/data/repository/auth_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUserEvent>(_onFetchUserEvent);
    on<UpgradeUserToAgentEvent>(_onUpgradeUserEvent);
    on<ClearUserEvent>(_onClearUser);
  }

  Future<void> _onFetchUserEvent(
    FetchUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final userRepo = locator.get<UserRepository>();

      await userRepo.fetchUser().then((user) {
        emit(UserSuccess(user: user));
      });
    } catch (e) {
      emit(UserFailed(errorMessage: "Login failed: ${e.toString()}"));
    }
  }

  Future<void> _onUpgradeUserEvent(
    UpgradeUserToAgentEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final userRepo = locator.get<UserRepository>();

      await userRepo.upgradeUserToAgent().then((_) async {
        ///   Fetch User
        final user = await userRepo.fetchUser();
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
