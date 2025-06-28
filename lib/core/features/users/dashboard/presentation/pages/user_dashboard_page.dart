import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../../presentation/components/avatar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../bloc/user_bloc.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class UserDashboardPage extends StatefulWidget {
  final Widget child;
  final String location;

  const UserDashboardPage({
    super.key,
    required this.child,
    required this.location,
  });

  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  int activeIndex = 0;

  final List<Map<String, dynamic>> bottomNavigationItems = [
    {
      'label': 'Home',
      'icon': 'assets/images/icons/home_outlined.svg',
      'icon_filled': 'assets/images/icons/home_filled.svg',
    },
    {
      'label': 'Explore',
      'icon': 'assets/images/icons/search_outlined.svg',
      'icon_filled': 'assets/images/icons/search_filled.svg',
    },
    {
      'label': 'Community',
      'icon': 'assets/images/icons/community_outlined.svg',
      'icon_filled': 'assets/images/icons/community_filled.svg',
    },
    {
      'label': 'Map',
      'icon': 'assets/images/icons/message_outlined.svg',
      'icon_filled': 'assets/images/icons/message_filled.svg',
    },
    {
      'label': 'Profile',
      'icon': 'assets/images/icons/profile_outlined.svg',
      'icon_filled': 'assets/images/icons/profile_filled.svg',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          extendBodyBehindAppBar: widget.location == '/user-map',
          extendBody: widget.location == '/user-map',
          appBar: widget.location == '/user-map'
              ? null
              : AppBar(
                  surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  actionsPadding: EdgeInsets.only(right: 20, left: 20),
                  automaticallyImplyLeading: false,
                  leadingWidth: 0,
                  title: widget.location != '/user-home'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 16,
                          children: [
                            Expanded(
                              child: Text(
                                'Profile',
                                style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Agent Mode",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    Icon(Icons.arrow_drop_down_rounded),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 16,
                          children: [
                            Avatar(
                              imageUrl:
                                  userState is UserSuccess &&
                                      userState.user != null
                                  ? userState.user!.avatarUrl!
                                  : '',
                              size: Size(48, 48),
                              onTap: () {
                                context.read<AuthBloc>().add(
                                  AuthSignOutEvent(),
                                );
                              },
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Good Morning 👋",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.color!
                                              .withValues(alpha: 0.6),
                                        ),
                                  ),
                                  Text(
                                    userState is UserSuccess &&
                                            userState.user != null
                                        ? (userState.user!.username!.isEmpty
                                              ? 'Anonymous'
                                              : userState.user!.username!)
                                        : 'Hunter',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: grey200, width: 1.5),
                              ),
                              child: UnconstrainedBox(
                                child: SvgPicture.asset(
                                  'assets/images/icons/notification_outlined.svg',
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.color!,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                  actions: [
                    // if (widget.location == '/user-profile')
                    //   ToggleSwitch(
                    //     initialLabelIndex: 0,
                    //     totalSwitches: 2,
                    //     cornerRadius: 100,
                    //     labels: ["Dark", "Light"],
                    //     inactiveBgColor: grey200,
                    //     activeFgColor: Theme.of(context).colorScheme.primary,
                    //     onToggle: (index) {
                    //       if (index == 0) {
                    //         context.read<ThemeCubit>().toggleTheme(true);
                    //       } else {
                    //         context.read<ThemeCubit>().toggleTheme(false);
                    //       }
                    //     },
                    //   )
                  ],
                ),
          bottomNavigationBar: ConvexAppBar(
            style: TabStyle.react,
            key: bottomNavigationKey,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            color: grey500,
            activeColor: Theme.of(context).colorScheme.primary,
            height: 70,
            shadowColor: grey800.withValues(alpha: 0.2),
            top: -20,
            elevation: 8,
            items: bottomNavigationItems
                .map(
                  (item) => TabItem(
                    icon: SvgPicture.asset(
                      item['icon'],
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(grey500, BlendMode.srcIn),
                    ),
                    // isIconBlend: true,
                    title: item['label'],
                    activeIcon: UnconstrainedBox(
                      child: SvgPicture.asset(
                        item['icon_filled'],
                        width: 28,
                        height: 28,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            initialActiveIndex: activeIndex,
            onTap: (index) {
              setState(() {
                activeIndex = index;
              });

              switch (index) {
                case 0:
                  context.goNamed("user-home");
                  break;
                case 1:
                  // Navigate to Explore
                  break;
                case 2:
                  // Navigate to Community
                  break;
                case 3:
                  // Navigate to Map
                  context.goNamed("user-map");
                  break;
                case 4:
                  context.goNamed("user-profile");
                  break;
              }
            },
          ),
          body: widget.child,
        );
      },
    );
  }
}
