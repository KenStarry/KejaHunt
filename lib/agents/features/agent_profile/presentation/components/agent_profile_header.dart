import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../core/features/users/dashboard/presentation/bloc/user_bloc.dart';
import '../../../../../core/presentation/components/avatar.dart';

class AgentProfileHeader extends StatefulWidget {
  const AgentProfileHeader({super.key});

  @override
  State<AgentProfileHeader> createState() => _AgentProfileHeaderState();
}

class _AgentProfileHeaderState extends State<AgentProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return MultiSliver(
          children: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16,
                children: [
                  Avatar(
                    imageUrl: userState is UserSuccess
                        ? userState.user!.avatarUrl!
                        : '',
                    size: Size(120, 120),
                  ),

                  userState is UserSuccess
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Text(
                              '${userState.user?.username}',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),

                            SvgPicture.asset(
                              "assets/images/icons/certificate_check.svg",
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.greenAccent
                    ),
                  ),
                  Text(
                    'Online',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              )
            )
          ],
        );
      },
    );
  }
}
