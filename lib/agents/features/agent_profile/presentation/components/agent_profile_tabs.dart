import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/presentation/components/custom_filled_button.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../core/features/users/dashboard/presentation/bloc/user_bloc.dart';
import '../../../../../core/presentation/components/avatar.dart';
import 'agent_profile_apartments.dart';

class AgentProfileTabs extends StatefulWidget {
  const AgentProfileTabs({super.key});

  @override
  State<AgentProfileTabs> createState() => _AgentProfileTabsState();
}

class _AgentProfileTabsState extends State<AgentProfileTabs> with SingleTickerProviderStateMixin {
  int activeTabIndex = 0;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            indicatorWeight: 1,
            padding: EdgeInsets.zero,
            dividerHeight: 0,
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.label,
            onTap: (index) {
              setState(() {
                activeTabIndex = index;
              });
            },
            physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            tabs: List.generate(10, (index) {
          final isActive = index == activeTabIndex;

          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        })),

        Expanded(child: AgentProfileApartments()),
      ],
    );
  }
}
