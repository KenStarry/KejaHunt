import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:keja_hunt/core/features/onboarding/presentation/model/bubble_model.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<BubbleModel> bubbles = [
    BubbleModel(
      url:
          "https://images.unsplash.com/photo-1664372623516-0b1540d6771e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      top: 100,
      size: Size(100, 100),
    ),
    BubbleModel(
      url:
          "https://images.unsplash.com/photo-1722421492323-eaf9c401befe?q=80&w=2002&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      top: 220,
      left: 80,
      size: Size(140, 140),
    ),
    BubbleModel(
      url:
          "https://images.unsplash.com/photo-1627141234469-24711efb373c?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      top: 200,
      left: 260,
      size: Size(70, 70),
    ),
    BubbleModel(
      url:
          "https://images.unsplash.com/photo-1515263487990-61b07816b324?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      top: 420,
      left: 120,
      size: Size(70, 70),
    ),
    BubbleModel(
      url:
          "https://images.unsplash.com/photo-1664372623516-0b1540d6771e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      top: 50,
      right: 100,
      size: Size(80, 80),
    ),
    BubbleModel(
      url:
          "https://images.unsplash.com/photo-1664372623516-0b1540d6771e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      bottom: 80,
      right: 20,
      size: Size(100, 100),
    ),
    BubbleModel(
      url:
      "https://images.unsplash.com/photo-1664372623516-0b1540d6771e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      bottom: 0,
      left: 0,
      size: Size(100, 100),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            /// Bubbles section
            Expanded(
              child: Stack(
                children: [
                  ...bubbles.map(
                    (bubble) => Positioned(
                      top: bubble.top,
                      left: bubble.left,
                      right: bubble.right,
                      bottom: bubble.bottom,
                      child:
                          CustomNetworkImage(
                                url: bubble.url,
                                makeRound: true,
                                size: bubble.size ?? Size(100, 100),
                              )
                              .animate(
                                autoPlay: true,
                                delay: Duration(milliseconds: (bubbles.indexOf(bubble) + 1) * 1000),
                                onComplete: (controller) =>
                                    controller.repeat(reverse: true),
                              )
                              .scale(
                                begin: Offset(1, 1),
                                end: Offset(1.3, 1.3),
                                duration: Duration(milliseconds: 3000),
                              ),
                      // .moveX(
                      //   duration: Duration(milliseconds: 10000),
                      //   begin: -20,
                      //   end: 500,
                      // ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50),

            Column(
              spacing: 16,
              children: [
                Text(
                  "Keja-Hunting Season Is\nON",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 32,
                  ),
                ),
                Text(
                  "Stretch your thumbs, sip your chai, and get ready to swipe through the best spots in town. Your future crib is waiting.",
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: grey600, fontSize: 16),
                ),
              ],
            ),

            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
