import 'package:flutter/material.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';

class ContentWrapperComponent extends StatelessWidget {
  final Widget child;

  const ContentWrapperComponent({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBoxComponent(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: spacing[5],
          ),
          child: child,
        ),
      ),
    );
  }
}
