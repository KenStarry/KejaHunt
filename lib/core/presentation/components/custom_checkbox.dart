import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class CustomCheckbox extends StatefulWidget {
  final String? label;
  final bool isChecked;
  final VoidCallback onTap;

  const CustomCheckbox({
    super.key,
    this.label,
    this.isChecked = false,
    required this.onTap,
  });

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
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: widget.isChecked
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 3,
              ),
            ),
            child: widget.isChecked
                ? Center(
                    child: UnconstrainedBox(
                      child: SvgPicture.asset(
                        "assets/images/icons/check.svg",
                        width: 12,
                        height: 12,
                        colorFilter: ColorFilter.mode(
                          whiteColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ),
        widget.label == null
            ? SizedBox.shrink()
            : Text(
                widget.label!,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
      ],
    );
  }
}
