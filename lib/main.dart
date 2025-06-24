import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keja_hunt/core/di/locator.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/bloc/upload_unit_bloc.dart';
import 'package:keja_hunt/core/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:keja_hunt/core/features/users/home/presentation/bloc/units_bloc.dart';
import 'package:keja_hunt/core/utils/theme/app_theme.dart';
import 'package:keja_hunt/core/features/users/dashboard/presentation/bloc/user_bloc.dart';
import 'package:keja_hunt/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/env/env.dart';
import 'core/features/auth/presentation/bloc/auth_bloc.dart';
import 'core/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'core/presentation/bloc/theme_cubit.dart';
import 'core/utils/routing/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Supabase
  await Supabase.initialize(url: Env.supabaseUrl, anonKey: Env.supabaseAnonKey);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(
          create: (context) =>
          AuthBloc()
            ..add(AuthCheckStatusEvent()),
        ),
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => UserBloc()),

        /// Agent
        BlocProvider(create: (context) => UploadUnitBloc()),

        /// User
        BlocProvider(create: (context) => UnitsBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final authBloc = context.read<AuthBloc>();

        return BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp.router(
              title: 'KejaHunt',
              theme: AppTheme.lightTheme(),
              darkTheme: AppTheme.darkTheme(),
              themeMode: themeMode,
              routerConfig: appRouter(authBloc),
              // routerDelegate: appRouter(authBloc).routerDelegate,
              // routeInformationParser: appRouter(authBloc).routeInformationParser,
              // routeInformationProvider: appRouter(
              //   authBloc,
              // ).routeInformationProvider,
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
