import 'package:flutter/material.dart';
import 'package:keja_hunt/core/features/onboarding/presentation/model/onboarding_card_model.dart';

class OnboardingCard extends StatefulWidget {

  final OnboardingCardModel onboardingCardModel;

  const OnboardingCard({super.key, required this.onboardingCardModel});

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
