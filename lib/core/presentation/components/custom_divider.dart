import 'package:flutter/material.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: 1, color: grey200);
  }
}
