import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mnsolutions/src/features/core/screens/history/history_screen.dart';

void main(List<String> args) {
  group(
    "History screen",
    () {
      test(
        "should render",
        (WidgetTester tester) async {
          await tester.pumpWidget(const HistoryScreen());
          expect(find.byType(Scaffold), findsNWidgets(1)); //
        } as Function(),
      );
    },
  );
}
