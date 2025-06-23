import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        color:grey50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<T>(
        value: widget.value,
        isExpanded: widget.isExpanded ?? true,
        underline: const SizedBox.shrink(),
        padding: EdgeInsets.symmetric(vertical: 6),
        iconSize: 16,
        hint: Text(
          widget.hint ?? '',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: Theme.of(
              context,
            ).textTheme.bodyLarge?.color!.withValues(alpha: 0.6),
          ),
        ),
        borderRadius: BorderRadius.circular(12),
        dropdownColor: Theme.of(context).colorScheme.onPrimary,
        focusColor: Theme.of(context).colorScheme.onPrimary,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
        icon: Padding(
          padding: const EdgeInsets.only(left: 45.0),
          child: UnconstrainedBox(
            child: SvgPicture.asset(
              'assets/images/icons/arrow_dropdown.svg',
              width: 12,
              height: 12,
              colorFilter: ColorFilter.mode(
                Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .color!
                    .withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        items: widget.items.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(widget.itemToString?.call(item) ?? item.toString(),
            style: Theme.of(context).textTheme.bodyMedium,),
          );
        }).toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
