import 'package:example_proj/widgets/landing/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets("Test Landing Screen View", (WidgetTester tester) async {
    // build StaffList
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(child: LandingScreen()),
            ],
          ),
        ),
      ),
    );

    // find elements
    expect(find.byType(RaisedButton), findsNWidgets(2));

    // validate button text
    expect(find.text("Manager View"), findsOneWidget);
    expect(find.text("Normal View"), findsOneWidget);
  });
}
