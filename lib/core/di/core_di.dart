import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keja_hunt/core/data/repository/agent_repository.dart';
import 'package:keja_hunt/core/data/repository/unit_repository.dart';
import 'package:keja_hunt/core/data/repository/user_repository.dart';
import 'package:keja_hunt/core/features/auth/data/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/repository/shared_prefs_repository.dart';

Future<void> setupCoreDI(GetIt locator) async {

  /// Shared preferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  locator.registerLazySingleton<SharedPrefsRepository>(() => SharedPrefsRepository());

  locator.registerLazySingleton<UserRepository>(() => UserRepository());
  locator.registerLazySingleton<AgentRepository>(() => AgentRepository());
  locator.registerLazySingleton<UnitRepository>(() => UnitRepository());
  locator.registerLazySingleton<ImagePicker>(() => ImagePicker());
}
