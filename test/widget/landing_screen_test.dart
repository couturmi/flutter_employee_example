import 'package:example_proj/widgets/landing/landing_screen.dart';
import 'package:example_proj/widgets/staff_list/staff_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock/mock_data.dart';

main() {
  Key managerButtonKey = Key(LandingScreen.MANAGER_BUTTON_KEY_ID);
  Key normalButtonKey = Key(LandingScreen.NORMAL_BUTTON_KEY_ID);

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
    expect(find.byKey(managerButtonKey), findsOneWidget);
    expect(find.byKey(normalButtonKey), findsOneWidget);
    expect(find.text("Manager View"), findsOneWidget);
    expect(find.text("Normal View"), findsOneWidget);
  });

  testWidgets("Test Selecting Manager View", (WidgetTester tester) async {
    final NavigatorObserver mockObserver = MockNavigatorObserver();

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
        navigatorObservers: [mockObserver],
      ),
    );

    // tap manager view
    await tester.tap(find.byKey(managerButtonKey));
    await tester.pumpAndSettle();

    // test navigation event occurred
    verify(mockObserver.didPush(any, any));

    // verify new screen is displayed
    expect(find.byType(StaffScreen), findsOneWidget);
  });

  testWidgets("Test Selecting Normal View", (WidgetTester tester) async {
    final NavigatorObserver mockObserver = MockNavigatorObserver();

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
        navigatorObservers: [mockObserver],
      ),
    );

    // tap manager view
    await tester.tap(find.byKey(normalButtonKey));
    await tester.pumpAndSettle();

    // test navigation event occurred
    verify(mockObserver.didPush(any, any));

    // verify new screen is displayed
    expect(find.byType(StaffScreen), findsOneWidget);
  });
}
