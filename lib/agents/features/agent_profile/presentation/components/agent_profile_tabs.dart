import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/presentation/components/custom_filled_button.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../core/features/users/dashboard/presentation/bloc/user_bloc.dart';
import '../../../../../core/presentation/components/avatar.dart';

class AgentProfileTabs extends StatefulWidget {
  const AgentProfileTabs({super.key});

  @override
  State<AgentProfileTabs> createState() => _AgentProfileTabsState();
}

class _AgentProfileTabsState extends State<AgentProfileTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(left: 20),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isActive = index == 0;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Joyous Apartments",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isActive
                        ? Theme.of(context).textTheme.bodyMedium?.color
                        : grey500,
                  ),
                ),

                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : grey300,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
