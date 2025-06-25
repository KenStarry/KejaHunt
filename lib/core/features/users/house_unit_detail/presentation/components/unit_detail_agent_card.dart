import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/domain/models/agents/agent_model.dart';
import 'package:keja_hunt/core/features/auth/domain/models/user_model.dart';
import 'package:keja_hunt/core/presentation/components/avatar.dart';
import 'package:keja_hunt/core/utils/constants/constants.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class UnitDetailAgentCard extends StatefulWidget {

  final UserModel? userModel;
  final AgentModel? agentModel;

  const UnitDetailAgentCard(
      {super.key, required this.agentModel, required this.userModel});

  @override
  State<UnitDetailAgentCard> createState() => _UnitDetailAgentCardState();
}

class _UnitDetailAgentCardState extends State<UnitDetailAgentCard> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          width: double.infinity,
          child: Row(
            spacing: 20,
            children: [
              Avatar(
                imageUrl: widget.userModel?.avatarUrl ?? '',
                size: Size(60, 60),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Text(
                      widget.userModel?.fullName ?? 'Unknown',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall,
                    ),
                    Text(
                      widget.agentModel?.agencyName ?? 'No Agency',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,
                    ),
                  ],
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/images/icons/message_outlined.svg",
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        Theme
                            .of(context)
                            .colorScheme
                            .primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      /// Make a Phone Call
                    },
                    icon: SvgPicture.asset(
                      "assets/images/icons/call_outlined.svg",
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        Theme
                            .of(context)
                            .colorScheme
                            .primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
