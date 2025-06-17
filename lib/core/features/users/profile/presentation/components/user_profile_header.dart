import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

import '../../../../../presentation/components/avatar.dart';
import '../../../dashboard/presentation/bloc/user_bloc.dart';

class UserProfileHeader extends StatefulWidget {
  const UserProfileHeader({super.key});

  @override
  State<UserProfileHeader> createState() => _UserProfileHeaderState();
}

class _UserProfileHeaderState extends State<UserProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              /// Avatar
              SizedBox(
                width: 140,
                height: 140,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircularPercentIndicator(
                        radius: 68,
                        percent: 0.75,
                        animation: true,
                        animateToInitialPercent: true,
                        progressColor: Theme.of(context).colorScheme.primary,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Avatar(
                          imageUrl: userState is UserSuccess
                              ? userState.user.avatarUrl!
                              : '',
                          size: Size(120, 120),
                          onTap: () {
                            // context.read<AuthBloc>().add(AuthSignOutEvent());
                          },
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.only(bottom: 6, right: 6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/images/icons/discount_filled.svg",
                            width: 26,
                            height: 26,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    "Carly Jones",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  Text(
                    "Keja Warrior", // Keja Hunter, Keja Beginner, Keja Roamer
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
              // Expanded(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     spacing: 16,
              //     children: [
              //
              //       /// Metrics
              //       Row(
              //         spacing: 24,
              //         children: [
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 "98",
              //                 style: Theme.of(context).textTheme.titleMedium
              //                     ?.copyWith(fontWeight: FontWeight.w700),
              //               ),
              //
              //               Text(
              //                 "Bookings",
              //                 style: Theme.of(context).textTheme.bodyMedium
              //                     ?.copyWith(fontWeight: FontWeight.w700,
              //                 color: Theme.of(context).textTheme.bodySmall?.color),
              //               ),
              //             ],
              //           ),
              //           Column(
              //             children: [
              //               Text(
              //                 "150",
              //                 style: Theme.of(context).textTheme.titleMedium
              //                     ?.copyWith(fontWeight: FontWeight.w700),
              //               ),
              //
              //               Text(
              //                 "Likes",
              //                 style: Theme.of(context).textTheme.bodyMedium
              //                     ?.copyWith(fontWeight: FontWeight.w700,
              //                     color: Theme.of(context).textTheme.bodyMedium?.color),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //
              //       Column(
              //         spacing: 8,
              //         children: [
              //           Row(
              //             children: [
              //               Expanded(
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   spacing: 8,
              //                   children: [
              //                     SvgPicture.asset(
              //                       "assets/images/icons/discount_outlined.svg",
              //                       width: 20,
              //                       height: 20,
              //                       colorFilter: ColorFilter.mode(
              //                         grey400,
              //                         BlendMode.srcIn,
              //                       ),
              //                     ),
              //
              //                     Text(
              //                       "Explorer",
              //                       style: Theme.of(context).textTheme.bodyLarge
              //                           ?.copyWith(fontWeight: FontWeight.w700),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //
              //               Text.rich(
              //                 TextSpan(
              //                   children: [
              //                     TextSpan(
              //                       text: "120 ",
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyMedium
              //                           ?.copyWith(fontWeight: FontWeight.w700),
              //                     ),
              //
              //                     TextSpan(
              //                       text: "Pts",
              //                       style: Theme.of(context).textTheme.bodySmall
              //                           ?.copyWith(fontWeight: FontWeight.w700),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //           LinearPercentIndicator(
              //             backgroundColor: grey100,
              //             progressColor: Theme.of(context).colorScheme.primary,
              //             lineHeight: 8,
              //             padding: EdgeInsets.zero,
              //             barRadius: Radius.circular(100),
              //             animation: true,
              //             animateToInitialPercent: true,
              //             percent: 0.37,
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
