import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vsla_desktop/main.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    // Build the app initializer (instead of MyApp directly)
    await tester.pumpWidget(const MyApp());

    // Let async DB initialization settle
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Check if something appears on screen (like splash screen)
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
