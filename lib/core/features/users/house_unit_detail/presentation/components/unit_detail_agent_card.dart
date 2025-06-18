import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/presentation/components/avatar.dart';
import 'package:keja_hunt/core/utils/constants.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class UnitDetailAgentCard extends StatefulWidget {
  const UnitDetailAgentCard({super.key});

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
                imageUrl:
                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                size: Size(60, 60),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Text(
                      "Natalya Wilodra",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "Keja Agent",
                      style: Theme.of(context).textTheme.bodyMedium,
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
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/images/icons/call_outlined.svg",
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
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
