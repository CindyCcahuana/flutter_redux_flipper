import 'package:flutter/material.dart';
import 'package:mnsolutions/src/common/constants/radius.dart';

class InkWellComponent extends StatelessWidget {
  final void Function() onTap;
  final Widget child;

  const InkWellComponent({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius[2]),
      child: Ink(
        child: child,
      ),
    );
  }
}
