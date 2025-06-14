import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/features/auth/auth_page.dart';
import 'package:keja_hunt/core/features/auth/general_auth/presentation/pages/general_auth_page.dart';
import 'package:keja_hunt/core/features/auth/login/presentation/pages/login_page.dart';
import 'package:keja_hunt/core/features/auth/signup/presentation/pages/signup_page.dart';
import 'package:keja_hunt/users/features/dashboard/presentation/pages/user_dashboard_page.dart';
import 'package:keja_hunt/users/features/home/presentation/pages/user_home_page.dart';

final authRoutes = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) =>
      AuthPage(child: navigationShell),
  branches: [generalAuthRoute, loginRoute, signupRoute],
);

final generalAuthRoute = StatefulShellBranch(
  routes: [
    GoRoute(
      path: '/general-auth',
      name: 'general-auth',
      builder: (context, state) => const GeneralAuthPage(),
    ),
  ],
);

final loginRoute = StatefulShellBranch(
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);

final signupRoute = StatefulShellBranch(
  routes: [
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignupPage(),
    ),
  ],
);
