import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void setupSupabaseDependencies(GetIt locator) {
  locator.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
}
