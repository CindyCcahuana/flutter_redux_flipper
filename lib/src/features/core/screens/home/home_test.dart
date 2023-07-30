import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mnsolutions/src/features/core/screens/home/home_screen.dart';

void main(List<String> args) {
  group(
    "Home screen",
    () {
      test(
        "should render",
        (WidgetTester tester) async {
          await tester.pumpWidget(const HomeScreen());
          expect(find.byType(Scaffold), findsNWidgets(1)); //
        } as Function(),
      );
    },
  );
}
