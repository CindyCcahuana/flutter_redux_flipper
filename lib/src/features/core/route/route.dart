import 'package:flutter/material.dart';
import 'package:mnsolutions/src/features/core/screens/history/history_screen.dart';
import 'package:mnsolutions/src/features/core/screens/home/home_screen.dart';
import 'package:mnsolutions/src/features/core/screens/profile/profile_screen.dart';

class RouteCore extends StatelessWidget {
  final int index;

  const RouteCore({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomeScreen(),
      const HistoryScreen(),
      const ProfileScreen(),
    ];
    return pages[index];
  }
}
