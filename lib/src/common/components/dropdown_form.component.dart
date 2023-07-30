import 'package:flutter/material.dart';
import 'package:mnsolutions/src/common/constants/radius.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';

class DropdownFormComponent extends StatelessWidget {
  final Object? value;
  final List<DropdownMenuItem<Object>>? items;
  final void Function(Object?)? onChanged;

  const DropdownFormComponent({
    super.key,
    this.value,
    this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing[2],
          vertical: spacing[1],
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius[4]),
          ),
        ),
        isDense: true,
        alignLabelWithHint: true,
      ),
    );
  }
}
