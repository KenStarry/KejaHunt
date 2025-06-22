import 'package:flutter/material.dart';

class StepperModel {
  final String inactiveIcon;
  final String activeIcon;
  final String title;
  final Widget stepperScreen;

  StepperModel({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.title,
    required this.stepperScreen
  });
}
