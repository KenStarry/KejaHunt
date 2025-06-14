import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/features/onboarding/presentation/components/onboarding_card.dart';
import 'package:keja_hunt/core/features/onboarding/presentation/model/onboarding_card_model.dart';
import 'package:keja_hunt/core/presentation/components/custom_filled_button.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final List<OnboardingCardModel> _items;
  late final slider.CarouselSliderController _carouselController;
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();

    _carouselController = slider.CarouselSliderController();

    _items = [
      OnboardingCardModel(
        title: "Let’s Find Your Dream\nKeja",
        description:
            "Discover hidden gems, local tips, and trusted listings — all powered by the KejaHunt community.",
        imageUrl:
            "https://images.unsplash.com/photo-1722421492323-eaf9c401befe?q=80&w=2002&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ),
      OnboardingCardModel(
        title: "Smarter Search,\nReal Insights",
        description:
            "Filter by location, price, amenities, and more — plus see what locals say about neighborhoods before you decide.",
        imageUrl:
            "https://images.unsplash.com/photo-1593696140826-c58b021acf8b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ),
      OnboardingCardModel(
        title: "Community First,\nAlways",
        description:
            "Vote on top areas, share listings, and help others find the perfect place — because better housing starts with us.",
        imageUrl:
            "https://images.unsplash.com/photo-1726471809185-24208f3cb6e6?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ),
      OnboardingCardModel(
        title: "Real-Time Home\nVibes",
        description:
            "Get real-time alerts when new homes match your vibe. Be the first to book a visit, every time.",
        imageUrl:
            "https://images.unsplash.com/photo-1649083048337-4aeb6dda80bb?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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
                carouselController: _carouselController,
                items: _items
                    .map((item) => OnboardingCard(onboardingCardModel: item))
                    .toList(),
                options: slider.CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 6),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1200),
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 16,
                children: [
                  //  dots indicator
                  AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: _items.length,
                    effect: ExpandingDotsEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      activeDotColor: Theme.of(context).colorScheme.primary,
                      dotColor: grey300,
                    ),
                  ),
                  //  action button
                  CustomFilledButton(
                    text: "Get Started",
                    onTap: () {
                      context.goNamed("user-home");
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
