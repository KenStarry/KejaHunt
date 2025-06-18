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
          appBar: AppBar(
            surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            actionsPadding: EdgeInsets.only(right: 20, left: 20),
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            title: widget.location != '/user-home' ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16,
              children: [
                Expanded(
                  child: Text(
                    'Profile',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.onPrimary
                    ),
                    child: Row(
                      children: [
                        Text("Agent Mode", style: Theme.of(context).textTheme.bodyMedium),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  ),
                )
              ],
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16,
              children: [
                Avatar(
                  imageUrl: userState is UserSuccess
                      ? userState.user.avatarUrl!
                      : '',
                  size: Size(48, 48),
                  onTap: () {
                    context.read<AuthBloc>().add(AuthSignOutEvent());
                  },
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning 👋",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.color!.withValues(alpha: 0.6),
                        ),
                      ),
                      Text(
                        userState is UserSuccess
                            ? (userState.user.username!.isEmpty
                                  ? 'Anonymous'
                                  : userState.user.username!)
                            : 'Hunter',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: grey200, width: 1.5),
                  ),
                  child: UnconstrainedBox(
                    child: SvgPicture.asset(
                      'assets/images/icons/notification_outlined.svg',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).textTheme.bodyMedium!.color!,
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
                  break;
                case 4:
                  context.goNamed("user-profile");
                  break;
              }
            },
          ),
          // bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          //   itemCount: bottomNavigationItems.length,
          //   tabBuilder: (index, isActive) => Container(
          //     width: double.infinity,
          //     height: double.infinity,
          //     margin: const EdgeInsets.only(top: 8),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         UnconstrainedBox(
          //           child: SvgPicture.asset(
          //             bottomNavigationItems[index][isActive ? 'icon_filled' : 'icon'],
          //             width: 24,
          //             height: 24,
          //             colorFilter: ColorFilter.mode(isActive ? Theme.of(context).colorScheme.primary : grey500, BlendMode.srcIn),
          //           ),
          //         ),
          //         Text(
          //           bottomNavigationItems[index]['label'],
          //           style: Theme.of(context).textTheme.bodySmall?.copyWith(
          //             fontWeight: FontWeight.w700,
          //             color: isActive ? Theme.of(context).colorScheme.primary : grey500,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          //   activeIndex: activeIndex,
          //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          //   elevation: 8,
          //   gapLocation: GapLocation.center,
          //   notchSmoothness: NotchSmoothness.softEdge,
          //   scaleFactor: 0.4,
          //   onTap: (index) {
          //     setState(() {
          //       activeIndex = index;
          //     });
          //   },
          // ),
          // bottomNavigationBar: Container(
          //   width: double.infinity,
          //   height: 70,
          //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).colorScheme.onPrimary,
          //     borderRadius: BorderRadius.circular(16),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Theme.of(
          //           context,
          //         ).colorScheme.shadow.withValues(alpha: 0.1),
          //         blurRadius: 10,
          //         offset: const Offset(0, 2),
          //       ),
          //     ],
          //   ),
          //   child: Row(
          //     children: bottomNavigationItems
          //         .map(
          //           (item) => Expanded(
          //             child: Container(
          //               width: double.infinity,
          //               height: double.infinity,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(16),
          //               ),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 spacing: 4,
          //                 children: [
          //                   SvgPicture.asset(
          //                     item['icon'],
          //                     width: 24,
          //                     height: 24,
          //                     colorFilter: ColorFilter.mode(
          //                       Theme.of(context).textTheme.bodyMedium!.color!
          //                           .withValues(alpha: 0.7),
          //                       BlendMode.srcIn,
          //                     ),
          //                   ),
          //                   Text(
          //                     item['label'],
          //                     style: TextStyle(
          //                       fontSize: Theme.of(
          //                         context,
          //                       ).textTheme.bodySmall!.fontSize,
          //                       color: Theme.of(
          //                         context,
          //                       ).textTheme.bodyMedium!.color,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         )
          //         .toList(),
          //   ),
          // ),
          // bottomNavigationBar: CurvedNavigationBar(
          //   key: bottomNavigationKey,
          //   backgroundColor: Colors.transparent,
          //   height: 75,
          //   animationDuration: Duration(milliseconds: 300),
          //   items: <Widget>[
          //     Icon(Icons.add, size: 30),
          //     Icon(Icons.list, size: 30),
          //     Icon(Icons.compare_arrows, size: 30),
          //     Icon(Icons.compare_arrows, size: 30),
          //   ],
          //   onTap: (index) {
          //
          //   },
          // ),
          body: widget.child,
        );
      },
    );
  }
}
