import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        leading: SvgPicture.asset(
          'assets/icons/menu.svg',
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            Theme.of(context).textTheme.bodyMedium!.color!,
            BlendMode.srcIn,
          ),
        ),
        title: Row(),
      ),
      body: widget.child,
    );
  }
}
