import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

import '../../../../../core/presentation/components/avatar.dart';

class UserDashboardPage extends StatefulWidget {
  final Widget child;

  const UserDashboardPage({super.key, required this.child});

  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actionsPadding: EdgeInsets.only(right: 20, left: 20),
        leading: GestureDetector(
          onTap: () {

          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              'assets/images/icons/menu.svg',
              width: 26,
              height: 26,
              colorFilter: ColorFilter.mode(
                Theme.of(context).textTheme.bodyMedium!.color!,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            SvgPicture.asset(
              'assets/images/icons/notification.svg',
              width: 26,
              height: 26,
              colorFilter: ColorFilter.mode(
                Theme.of(context).textTheme.bodyMedium!.color!,
                BlendMode.srcIn,
              ),
            ),

            Avatar(
              imageUrl:
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              size: Size(40, 40),
            ),
          ],
        ),
      ),
      body: widget.child,
    );
  }
}
