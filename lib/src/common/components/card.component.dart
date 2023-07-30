import 'package:flutter/material.dart';
import 'package:mnsolutions/src/common/constants/radius.dart';

class CardComponent extends StatelessWidget {
  final Widget? child;

  const CardComponent({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius[2]),
      ),
      child: child,
    );
  }
}
