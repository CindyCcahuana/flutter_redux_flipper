import 'package:flutter/material.dart';
import 'package:mnsolutions/src/common/constants/radius.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';

class TextInputComponent extends StatelessWidget {
  final Widget? prefix;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(String string) onChanged;
  final bool autofocus;
  final TextInputType? keyboardType;
  final bool obscureText;
  final double? padding;
  final int? maxLines;

  const TextInputComponent({
    super.key,
    this.prefix,
    this.hintText,
    this.labelText,
    this.validator,
    required this.onChanged,
    this.autofocus = false,
    this.keyboardType,
    this.obscureText = false,
    this.padding,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      autofocus: autofocus,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: padding ?? spacing[5],
          vertical: padding ?? spacing[5],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius[2])),
        ),
        isDense: true,
        alignLabelWithHint: true,
        prefix: prefix,
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
