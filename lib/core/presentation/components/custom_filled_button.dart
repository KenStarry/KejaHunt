import 'package:flutter/material.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback onTap;

  const CustomFilledButton({
    super.key,
    required this.text,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: whiteColor),
      ),
    );
  }
}
