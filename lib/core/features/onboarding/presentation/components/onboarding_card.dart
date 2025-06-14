import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:keja_hunt/core/features/onboarding/presentation/model/onboarding_card_model.dart';
import 'package:keja_hunt/core/presentation/components/house_network_image.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class VerticalCapsuleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    double width = size.width;
    double height = size.height;
    double radius = width / 2;

    // Start from bottom-left
    path.moveTo(0, height - 20);

    // Bottom-left corner
    path.quadraticBezierTo(0, height, 20, height);

    // Bottom edge
    path.lineTo(width - 20, height);

    // Bottom-right corner
    path.quadraticBezierTo(width, height, width, height - 20);

    // Right edge upward
    path.lineTo(width, radius);

    // Top arc (semi-circle)
    path.arcToPoint(
      Offset(0, radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // Left edge downward
    path.lineTo(0, height - 20);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class OnboardingCard extends StatefulWidget {
  final OnboardingCardModel onboardingCardModel;

  const OnboardingCard({super.key, required this.onboardingCardModel});

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: ClipPath(
              clipper: VerticalCapsuleClipper(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70),
                  ),
                  child:
                      HouseNetworkImage(
                            url: widget.onboardingCardModel.imageUrl,
                          )
                          .animate(autoPlay: true)
                          .scale(
                            begin: Offset(1, 1),
                            end: Offset(1.4, 1.4),
                            duration: Duration(milliseconds: 10000),
                          ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  Text(
                    widget.onboardingCardModel.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    widget.onboardingCardModel.description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
