import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final Color? filledColor;
  final Color? textColor;
  final FocusNode? focusNode;
  final double? fontSize;
  final String hintText;
  final double? hintFontSize;
  final Color? borderColor;
  final Color? hintColor;
  final Color? cursorColor;
  final bool? readOnly;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  final bool? obscureText;
  final EdgeInsets? contentPadding;
  final Widget? prefix;
  final List<TextInputFormatter>? fieldFormatters;
  final bool? enableCopy;

  const CustomTextField({
    super.key,
    required this.controller,
    this.inputType,
    this.filledColor,
    this.cursorColor,
    this.focusNode,
    this.fontSize,
    required this.hintText,
    this.hintFontSize,
    this.borderColor,
    this.hintColor,
    this.readOnly,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.minLines,
    this.prefix,
    this.validator,
    this.onChanged,
    this.obscureText,
    this.textColor,
    this.contentPadding,
    this.fieldFormatters,
    this.enableCopy,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      focusNode: focusNode,
      keyboardType: inputType ?? TextInputType.text,
      cursorColor: cursorColor ?? theme.colorScheme.tertiary.withValues(alpha: 0.5),
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      style: Theme.of(
        context,
      ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 8.0,
                  top: 2.0,
                  bottom: 2.0,
                ),
                child: UnconstrainedBox(child: prefixIcon),
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 2.0,
                  bottom: 2.0,
                ),
                child: suffixIcon,
              )
            : null,
        filled: true,
        fillColor: grey50,
        hintText: hintText,
        errorMaxLines: 2,
        errorStyle: TextStyle(
          fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.bodyLarge!.fontWeight,
          color: redColor,
        ),
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w400,
          color: Theme.of(
            context,
          ).textTheme.bodyLarge?.color!.withValues(alpha: 0.6),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent, width: 1),
        ),
        prefix: prefix,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      inputFormatters: fieldFormatters,
      enableInteractiveSelection: enableCopy,
    );
  }
}
