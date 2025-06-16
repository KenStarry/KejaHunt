import 'package:go_router/go_router.dart';
import 'package:keja_hunt/agents/features/dashboard/presentation/pages/agent_dashboard_page.dart';
import 'package:keja_hunt/agents/features/home/presentation/pages/agent_home_page.dart';
import 'package:keja_hunt/core/features/users/dashboard/presentation/pages/user_dashboard_page.dart';
import 'package:keja_hunt/core/features/users/home/presentation/pages/user_home_page.dart';

final agentDashboardRoute = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) => AgentDashboardPage(child: navigationShell),
  branches: [
    agentHomePageRoute,
  ],
);

final agentHomePageRoute = StatefulShellBranch(
  routes: [
    GoRoute(
      path: '/agent-home',
      name: 'agent-home',
      builder: (context, state) => const AgentHomePage(),
    ),
  ],
);
