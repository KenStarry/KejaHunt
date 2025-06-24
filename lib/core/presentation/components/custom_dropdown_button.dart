import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../utils/theme/colors.dart';

class CustomDropdownButton<T> extends StatefulWidget {
  final double? width;
  final double? height;
  final bool? isExpanded;
  final T? value;
  final String? hint;
  final Color? color;
  final List<T> items;
  final String Function(T)? itemToString;
  final List<DropdownMenuItem<T>>? dropdownMenuItems;
  final ValueChanged<T?>? onChanged;

  const CustomDropdownButton({
    super.key,
    this.color,
    this.width,
    this.height,
    this.isExpanded,
    this.value,
    this.hint,
    required this.items,
    this.dropdownMenuItems,
    this.itemToString,
    this.onChanged,
  });

  @override
  State<CustomDropdownButton<T>> createState() =>
      _CustomDropdownButtonState<T>();
}

class _CustomDropdownButtonState<T> extends State<CustomDropdownButton<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: grey50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton2<T>(
        value: widget.value,
        isExpanded: widget.isExpanded ?? true,
        underline: const SizedBox.shrink(),
        // padding: EdgeInsets.symmetric(vertical: 6),
        // iconSize: 16,
        hint: Text(
          widget.hint ?? '',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: Theme.of(
              context,
            ).textTheme.bodyLarge?.color!.withValues(alpha: 0.6),
          ),
        ),
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
        menuItemStyleData: MenuItemStyleData(
          height: 60
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: grey300.withValues(alpha: 0.8),
                offset: Offset(0, 8),
                blurRadius: 15,
              ),
            ],
          ),
        ),
        iconStyleData: IconStyleData(
          openMenuIcon: Transform.flip(
            flipY: true,
            child: SvgPicture.asset(
              'assets/images/icons/arrow_dropdown.svg',
              width: 12,
              height: 12,
              colorFilter: ColorFilter.mode(
                Theme.of(
                  context,
                ).textTheme.bodyMedium!.color!.withValues(alpha: 0.5),
                BlendMode.srcIn,
              ),
            ),
          ),
          icon: SvgPicture.asset(
            'assets/images/icons/arrow_dropdown.svg',
            width: 12,
            height: 12,
            colorFilter: ColorFilter.mode(
              Theme.of(
                context,
              ).textTheme.bodyMedium!.color!.withValues(alpha: 0.5),
              BlendMode.srcIn,
            ),
          ),
        ),
        items:
            widget.dropdownMenuItems ??
            widget.items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(
                  widget.itemToString?.call(item) ?? item.toString(),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              );
            }).toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
