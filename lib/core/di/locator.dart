import 'package:get_it/get_it.dart';
import 'package:keja_hunt/core/di/agent_di.dart';
import 'package:keja_hunt/core/di/auth_di.dart';
import 'package:keja_hunt/core/di/core_di.dart';
import 'package:keja_hunt/core/di/dash_di.dart';
import 'package:keja_hunt/core/di/supabase_di.dart';

import 'firebase_di.dart';

final locator = GetIt.instance;

/// This function is used to register all the dependencies in the app.
Future<void> setupLocator() async {
  setupSupabaseDI(locator);
  setupFirebaseDI(locator);
  setupAuthDI(locator);
  setupDashDI(locator);
  await setupCoreDI(locator);

  setupAgentDI(locator);
}
