import 'package:flutter/material.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class CustomCheckbox extends StatefulWidget {
  final String? label;

  const CustomCheckbox({super.key, this.label});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: widget.label == null ? 0 : 12,
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 3,
            ),
          ),
        ),
        widget.label == null
            ? SizedBox.shrink()
            : Text(
                widget.label!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700
                ),
              ),
      ],
    );
  }
}
