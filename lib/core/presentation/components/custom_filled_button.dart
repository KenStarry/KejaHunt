import 'package:flutter/material.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final bool isLoading;
  final VoidCallback onTap;

  const CustomFilledButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? SpinKitCircle(color: whiteColor, size: 32)
              : Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ),
      ),
    );
  }
}
