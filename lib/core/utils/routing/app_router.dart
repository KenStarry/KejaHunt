import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/agents/features/dashboard/presentation/pages/agent_dashboard_page.dart';
import 'package:keja_hunt/core/features/auth/data/classes/gorouter_refresh_stream.dart';
import 'package:keja_hunt/core/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keja_hunt/core/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:keja_hunt/core/features/onboarding/presentation/pages/welcome_page.dart';
import 'package:keja_hunt/core/utils/routing/agent_routes.dart';
import 'package:keja_hunt/core/utils/routing/auth_routes.dart';
import 'package:keja_hunt/core/utils/routing/user_routes.dart';
import 'package:keja_hunt/core/features/users/dashboard/presentation/bloc/user_bloc.dart';
import 'package:keja_hunt/core/features/users/dashboard/presentation/pages/user_dashboard_page.dart';

/// Onboarding Routes
final GoRoute welcomeRoute = GoRoute(
  path: '/welcome',
  name: 'welcome',
  builder: (context, state) => const WelcomePage(),
);

final GoRoute onboardingRoute = GoRoute(
  path: '/onboarding',
  name: 'onboarding',
  builder: (context, state) => const OnboardingPage(),
);

GoRouter appRouter(AuthBloc authBloc) => GoRouter(
  refreshListenable: GorouterRefreshStream(authBloc.stream),
    initialLocation: '/user-profile',
    redirect: (context, state) {
      final authState = authBloc.state;

      final isLoggedIn = authState is Authenticated;
      final isUserLoggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn && !isUserLoggingIn) {
        return '/login';
      }

      if (isLoggedIn && isUserLoggingIn) {
        /// Fetch User Details
        context.read<UserBloc>().add(FetchUserEvent());

        return '/user-home';
        // return '/user-profile';
      }

      return null;
    },
    routes: [
      // Welcome Route
      welcomeRoute,

      // Onboarding Route
      onboardingRoute,

      /// Auth Routes
      authRoutes,

      /// Agent Routes
      agentDashboardRoute,

      /// User Routes
      userDashboardRoutes,
    ],
  );
