import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/agents/features/dashboard/presentation/pages/agent_dashboard_page.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/domain/models/units/unit_review_model.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/pages/agent_unit_upload_page.dart';
import 'package:keja_hunt/core/features/auth/data/classes/gorouter_refresh_stream.dart';
import 'package:keja_hunt/core/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keja_hunt/core/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:keja_hunt/core/features/onboarding/presentation/pages/welcome_page.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/pages/bloc/reviews_bloc.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/pages/house_unit_detail_page.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/pages/screens/gallery_page.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/pages/screens/reviews_page.dart';
import 'package:keja_hunt/core/utils/routing/agent_routes.dart';
import 'package:keja_hunt/core/utils/routing/auth_routes.dart';
import 'package:keja_hunt/core/utils/routing/user_routes.dart';
import 'package:keja_hunt/core/features/users/dashboard/presentation/bloc/user_bloc.dart';
import 'package:keja_hunt/core/features/users/dashboard/presentation/pages/user_dashboard_page.dart';

import '../../domain/enum/units/unit_type_enum.dart';
import '../../domain/models/unit_image_model.dart';

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
  builder: (context, state) =>
      HouseUnitDetailPage(houseUnitModel: state.extra as HouseUnitModel),
);

final GoRoute galleryRoute = GoRoute(
  path: '/gallery',
  name: 'gallery',
  builder: (context, state) =>
      GalleryPage(unitImages: state.extra as List<UnitImageModel>),
);

final GoRoute reviewsRoute = GoRoute(
  path: '/reviews',
  name: 'reviews',
  builder: (context, state) {
    if (state.matchedLocation == '/reviews') {
      context.read<ReviewsBloc>().add(
        FetchAllUnitReviews(unitId: state.extra as String),
      );
    }

    return ReviewsPage();
  },
);

final GoRoute agentUnitUploadRoute = GoRoute(
  path: '/agent-unit-upload',
  name: 'agent-unit-upload',
  builder: (context, state) => AgentUnitUploadPage(),
);

GoRouter appRouter(AuthBloc authBloc) => GoRouter(
  refreshListenable: GorouterRefreshStream(authBloc.stream),
  initialLocation: '/user-home',
  initialExtra: <UnitReviewModel>[],
  // initialExtra: HouseUnitModel(apartmentId: "er4", unitType: UnitTypeEnum.mansion.name, price: 35000),
  // initialExtra: [
  //   UnitImageModel(
  //     imageUrl:
  //     "https://images.unsplash.com/photo-1592898918831-cc7eea4ea57c?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  //     imageTag: "Unlabelled",
  //   ),
  //   UnitImageModel(
  //     imageUrl:
  //         "https://images.unsplash.com/photo-1592898918831-cc7eea4ea57c?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  //     imageTag: "Kitchen",
  //   ),
  //   UnitImageModel(
  //     imageUrl:
  //     "https://images.unsplash.com/photo-1664372623516-0b1540d6771e?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  //     imageTag: "Kitchen",
  //   ),
  //   UnitImageModel(
  //     imageUrl:
  //     "https://images.unsplash.com/photo-1592898918831-cc7eea4ea57c?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  //     imageTag: "Kitchen",
  //   ),
  //   UnitImageModel(
  //     imageUrl:
  //     "https://images.unsplash.com/photo-1592898918831-cc7eea4ea57c?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  //     imageTag: "Bedroom",
  //   ),
  //   UnitImageModel(
  //     imageUrl:
  //     "https://images.unsplash.com/photo-1592898918831-cc7eea4ea57c?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  //     imageTag: "Bedroom",
  //   ),
  // ],
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

    galleryRoute,

    reviewsRoute,

    /// Auth Routes
    authRoutes,

    /// Agent Routes
    agentDashboardRoute,
    agentUnitUploadRoute,

    /// User Routes
    userDashboardRoutes,
  ],
);
