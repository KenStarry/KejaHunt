import 'package:get_it/get_it.dart';
import 'package:keja_hunt/core/features/auth/data/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void setupAuthDI(GetIt locator) {
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
}
