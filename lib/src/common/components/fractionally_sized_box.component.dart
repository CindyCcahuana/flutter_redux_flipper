import 'package:flutter/material.dart';
import 'package:mnsolutions/src/common/constants/fractionally.dart';

class FractionallySizedBoxComponent extends StatelessWidget {
  final Widget child;

  const FractionallySizedBoxComponent({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor[0],
      child: child,
    );
  }
}
