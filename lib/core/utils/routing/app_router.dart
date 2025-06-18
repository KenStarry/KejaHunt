import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/agents/features/dashboard/presentation/pages/agent_dashboard_page.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/features/auth/data/classes/gorouter_refresh_stream.dart';
import 'package:keja_hunt/core/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keja_hunt/core/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:keja_hunt/core/features/onboarding/presentation/pages/welcome_page.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/pages/house_unit_detail_page.dart';
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

final GoRoute unitDetailRoute = GoRoute(
  path: '/unit-detail',
  name: 'unit-detail',
  builder: (context, state) => HouseUnitDetailPage(
    houseUnitModel: HouseUnitModel(
      features: [
        UnitFeatureModel(
          featureName: "Bed",
          featureDescription: "8 Beds",
          featureIconPath: "assets/images/icons/features/car_park.svg"
        ),
        UnitFeatureModel(
            featureName: "Balcony",
            featureDescription: "",
            featureIconPath: "assets/images/icons/features/car_park.svg"
        ),
        UnitFeatureModel(
            featureName: "Balcony",
            featureDescription: "",
            featureIconPath: "assets/images/icons/features/car_park.svg"
        ),
      ],
      images: [
        "https://images.unsplash.com/photo-1666282167632-c613fbeb163c?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1670244208613-6da9cefb3ba1?q=80&w=770&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1670244208039-ff6275134b67?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1715985160053-d339e8b6eb94?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      ],
    ),
  ),
);

GoRouter appRouter(AuthBloc authBloc) => GoRouter(
  refreshListenable: GorouterRefreshStream(authBloc.stream),
  initialLocation: '/unit-detail',
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
    }

    return null;
  },
  routes: [
    // Welcome Route
    welcomeRoute,

    // Onboarding Route
    onboardingRoute,

    //  House Unit Detail Page
    unitDetailRoute,

    /// Auth Routes
    authRoutes,

    /// Agent Routes
    agentDashboardRoute,

    /// User Routes
    userDashboardRoutes,
  ],
);
