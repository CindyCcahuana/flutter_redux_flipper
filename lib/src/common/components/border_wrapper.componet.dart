import 'package:flutter/material.dart';
import 'package:mnsolutions/src/common/constants/radius.dart';

class BorderWrapperComponent extends StatelessWidget {
  final Widget child;

  const BorderWrapperComponent({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius[2]),
      child: child,
    );
  }
}
