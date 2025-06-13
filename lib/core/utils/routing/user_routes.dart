import 'package:go_router/go_router.dart';
import 'package:keja_hunt/users/features/dashboard/presentation/pages/user_dashboard_page.dart';
import 'package:keja_hunt/users/features/home/presentation/pages/user_home_page.dart';

final userDashboardRoute = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) => UserDashboardPage(child: navigationShell),
  branches: [
    userHomePageRoute,
  ],
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
