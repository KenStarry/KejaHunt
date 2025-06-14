import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:keja_hunt/core/features/onboarding/presentation/components/onboarding_card.dart';
import 'package:keja_hunt/core/features/onboarding/presentation/model/onboarding_card_model.dart';
import 'package:keja_hunt/core/presentation/components/custom_filled_button.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final List<OnboardingCardModel> _items;

  @override
  void initState() {
    super.initState();

    _items = [
      OnboardingCardModel(
        title: "Thousands of the best real estate at affordable prices",
        description: "",
        imageUrl:
            "https://images.unsplash.com/photo-1479839672679-a46483c0e7c8?q=80&w=1910&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ),
      OnboardingCardModel(
        title: "Book a real estate quickly and easily with one click",
        description: "",
        imageUrl:
            "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ),
      OnboardingCardModel(
        title: "Let's find the real estate that suits you right now!",
        description: "",
        imageUrl:
            "https://images.unsplash.com/photo-1502005229762-cf1b2da7c5d6?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 80),

            /// Carousel Slider for Onboarding Screens
            Expanded(
              child: slider.CarouselSlider(
                items: _items
                    .map((item) => OnboardingCard(onboardingCardModel: item))
                    .toList(),
                options: slider.CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                //  dots indicator
                //  action button
                CustomFilledButton(text: "Next", onTap: () {})
              ]),
            ),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
