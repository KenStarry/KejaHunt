import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/agents/features/agent_profile/presentation/bloc/agent_apartments_bloc.dart';
import 'package:keja_hunt/agents/features/agent_profile/presentation/components/agent_profile_apartments.dart';
import 'package:keja_hunt/agents/features/agent_profile/presentation/components/agent_profile_header.dart';
import 'package:keja_hunt/core/features/users/dashboard/presentation/bloc/user_bloc.dart';
import 'package:keja_hunt/core/presentation/components/avatar.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class AgentProfilePage extends StatefulWidget {
  final String userId;

  const AgentProfilePage({super.key, required this.userId});

  @override
  State<AgentProfilePage> createState() => _AgentProfilePageState();
}

class _AgentProfilePageState extends State<AgentProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Text(
            //   "Agent Profile",
            //   style: Theme.of(context).textTheme.titleSmall,
            // ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Builder(
        builder: (context) {
          final userState = context.watch<UserBloc>().state;
          final apartmentsState = context.watch<AgentApartmentsBloc>().state;

          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              spacing: 24,
              children: [
                AgentProfileHeader(),
                Expanded(child: AgentProfileApartments())
              ],
            ),
          );
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              slivers: [
                AgentProfileHeader(),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
                AgentProfileApartments()
              ],
            ),
          );
        },
      ),
    );
  }
}
