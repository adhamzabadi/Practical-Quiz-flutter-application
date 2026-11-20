import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mytaskqouiz/main.dart';

void main() {
  testWidgets('Checking a task updates counter and completed page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Completed: 0 / 4'), findsOneWidget);

    await tester.tap(find.byType(Checkbox).first);
    await tester.pump();
    expect(find.text('Completed: 1 / 4'), findsOneWidget);

    await tester.tap(find.text('View Completed Tasks'));
    await tester.pumpAndSettle();
    expect(find.text('Completed Tasks'), findsOneWidget);
    expect(find.text('Study Flutter'), findsOneWidget);

    await tester.tap(find.text('Back to Main Page'));
    await tester.pumpAndSettle();
    expect(find.text('My Tasks'), findsOneWidget);
  });
}
