import 'package:get_it/get_it.dart';
import 'package:keja_hunt/core/data/repository/agent_repository.dart';
import 'package:keja_hunt/core/data/repository/unit_repository.dart';
import 'package:keja_hunt/core/data/repository/user_repository.dart';
import 'package:keja_hunt/core/features/auth/data/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void setupCoreDI(GetIt locator) {
  locator.registerLazySingleton<UserRepository>(() => UserRepository());
  locator.registerLazySingleton<AgentRepository>(() => AgentRepository());
  locator.registerLazySingleton<UnitRepository>(() => UnitRepository());
}
