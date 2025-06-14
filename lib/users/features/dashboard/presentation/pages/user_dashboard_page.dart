import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

import '../../../../../core/presentation/components/avatar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

class UserDashboardPage extends StatefulWidget {
  final Widget child;

  const UserDashboardPage({super.key, required this.child});

  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  final List<Map<String, dynamic>> bottomNavigationItems = [
    {
      'label': 'Home',
      'icon': 'assets/images/icons/home.svg',
    },
    {
      'label': 'Community',
      'icon': 'assets/images/icons/home.svg',
    },
    {
      'label': 'Discover',
      'icon': 'assets/images/icons/home.svg',
    },
    {
      'label': 'Settings',
      'icon': 'assets/images/icons/home.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actionsPadding: EdgeInsets.only(right: 20, left: 20),
        // leading: GestureDetector(
        //   onTap: () {
        //
        //   },
        //   child: Container(
        //     width: double.infinity,
        //     height: double.infinity,
        //     padding: const EdgeInsets.all(8),
        //     child: SvgPicture.asset(
        //       'assets/images/icons/menu.svg',
        //       width: 26,
        //       height: 26,
        //       colorFilter: ColorFilter.mode(
        //         Theme.of(context).textTheme.bodyMedium!.color!,
        //         BlendMode.srcIn,
        //       ),
        //     ),
        //   ),
        // ),
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            Avatar(
              imageUrl:
              'https://plus.unsplash.com/premium_photo-1688740375397-34605b6abe48?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              size: Size(48, 48),
            ),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Good Morning 👋", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium?.color!.withValues(alpha: 0.6)
                )),
                Text(
                  "Ashley Keen",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )),
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
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: bottomNavigationItems.map((item) => Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: [
                  SvgPicture.asset(
                    item['icon'],
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).textTheme.bodyMedium!.color!.withValues(alpha: 0.7),
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    item['label'],
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ),
                ],
              ),
            ),
          )).toList(),
        ),
      ),
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
  }
}
