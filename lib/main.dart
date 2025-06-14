import 'package:flutter/material.dart';
import 'package:keja_hunt/core/utils/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/utils/routing/app_router.dart';
import 'env/env.dart';

Future<void> main() async {
  /// Initialize Supabase
  await Supabase.initialize(url: Env.supabaseUrl, anonKey: Env.supabaseAnonKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'KejaHunt',
      theme: AppTheme.lightTheme(),
      themeMode: ThemeMode.light,
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
