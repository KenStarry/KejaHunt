import 'package:go_router/go_router.dart';
import 'package:keja_hunt/agents/features/dashboard/presentation/pages/agent_dashboard_page.dart';
import 'package:keja_hunt/core/utils/routing/agent_routes.dart';
import 'package:keja_hunt/core/utils/routing/user_routes.dart';
import 'package:keja_hunt/users/features/dashboard/presentation/pages/user_dashboard_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/user-home',
  routes: [
    /// Agent Routes
    agentDashboardRoute,

    /// User Routes
    userDashboardRoute
  ],
);
