import 'package:flutter/material.dart';
import 'package:mnsolutions/src/common/navigators/bottom_navigation_bar.navigator.dart';
import 'package:mnsolutions/src/features/core/route/route.dart';

class CoreIndex extends StatefulWidget {
  static const String route = '/core';

  final int initialIndex;

  const CoreIndex({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<CoreIndex> createState() => _CoreIndexState();
}

class _CoreIndexState extends State<CoreIndex> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentIndex = widget.initialIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarNavigator(
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_work_rounded),
          label: 'Home',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_edu_rounded),
          label: 'History',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_rounded),
          label: 'Profile',
          backgroundColor: Colors.red,
        ),
      ],
      body: RouteCore(index: currentIndex),
    );
  }
}
