import 'package:flutter/material.dart';

class BottomNavigationBarNavigator extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final int currentIndex;
  final void Function(int)? onTap;
  final List<BottomNavigationBarItem> items;

  const BottomNavigationBarNavigator({
    super.key,
    this.appBar,
    this.body,
    this.currentIndex = 0,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: items,
      ),
    );
  }
}
