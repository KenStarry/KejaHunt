import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/features/users/dashboard/presentation/pages/user_dashboard_page.dart';
import 'package:keja_hunt/core/features/users/home/presentation/pages/user_home_page.dart';
import 'package:keja_hunt/core/features/users/profile/presentation/pages/user_profile_page.dart';

import '../../features/users/dashboard/presentation/bloc/user_bloc.dart';

final userDashboardRoutes = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) {
    final isHomePage = state.matchedLocation == '/user-home';

    return UserDashboardPage(
      location: state.matchedLocation,
      child: navigationShell,
    );
  },
  branches: [userHomePageRoute, userProfilePageRoute],
);

final userHomePageRoute = StatefulShellBranch(
  routes: [
    GoRoute(
      path: '/user-home',
      name: 'user-home',
      builder: (context, state) => const UserHomePage(),
    ),
  ],
);

final userProfilePageRoute = StatefulShellBranch(
  routes: [
    GoRoute(
      path: '/user-profile',
      name: 'user-profile',
      builder: (context, state) {

        if (state.matchedLocation == '/user-profile') {
          context.read<UserBloc>().add(FetchUserEvent());
        }

        return const UserProfilePage();
      },
    ),
  ],
);
