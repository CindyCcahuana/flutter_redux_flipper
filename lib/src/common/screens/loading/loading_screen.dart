import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  static const String route = '/loading';

  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: CircularProgressIndicator(),
      )),
    );
  }
}
