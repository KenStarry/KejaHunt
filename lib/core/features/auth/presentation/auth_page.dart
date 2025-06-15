import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class AuthPage extends StatefulWidget {
  final Widget child;

  const AuthPage({super.key, required this.child});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyMedium!.color!,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Stack(
        children: [
          widget.child,
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: UnconstrainedBox(
          //     child: Container(
          //       width: 250,
          //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          //       decoration: BoxDecoration(
          //           color: Theme.of(context).scaffoldBackgroundColor,
          //           borderRadius: BorderRadius.circular(16),
          //           boxShadow: [
          //             BoxShadow(
          //               color: grey800.withValues(alpha: 0.2),
          //               blurRadius: 10,
          //               offset: const Offset(0, 4),
          //             )
          //           ]
          //       ),
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         spacing: 16,
          //         children: [
          //           SvgPicture.asset(
          //             'assets/images/icons/success_check.svg',
          //             width: 30,
          //             height: 30,
          //             colorFilter: ColorFilter.mode(
          //               Theme.of(context).colorScheme.primary,
          //               BlendMode.srcIn,
          //             ),
          //           ),
          //           Expanded(
          //             child: Text("Logged In Successfully!", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          //               fontWeight: FontWeight.w700
          //             ),),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
