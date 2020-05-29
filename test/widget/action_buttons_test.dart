import 'package:example_proj/bloc/employee_bloc.dart';
import 'package:example_proj/bloc/view_type_bloc.dart';
import 'package:example_proj/widgets/staff_list/action_buttons.dart';
import 'package:example_proj/widgets/staff_list/staff_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock/mock_data.dart';

main() {
  final Key loadButtonKey = Key(ActionButtons.LOAD_BUTTON_KEY_ID);
  final Key clearButtonKey = Key(ActionButtons.CLEAR_BUTTON_KEY_ID);
  EmployeeBloc mockEmployeeBloc;

  setUp(() {
    mockEmployeeBloc = MockEmployeeBloc();
  });

  testWidgets("Test Action Buttons are visible", (WidgetTester tester) async {
    await tester.pumpWidget(
      _createTestActionButtons(mockEmployeeBloc),
    );

    expect(find.byType(RaisedButton), findsNWidgets(2));
    expect(find.text("Load"), findsOneWidget);
    expect(find.text("Clear"), findsOneWidget);
  });

  testWidgets("Test Load Button", (WidgetTester tester) async {
    await tester.pumpWidget(
      _createTestActionButtons(mockEmployeeBloc),
    );

    // tap load button
    await tester.tap(find.byKey(loadButtonKey));
    await tester.pump();

    // validate that the bloc was called
    verify(mockEmployeeBloc.add(EmployeeListEvent.load)).called(1);
    verifyNever(mockEmployeeBloc.add(EmployeeListEvent.clear));
  });

  testWidgets("Test Clear Button", (WidgetTester tester) async {
    await tester.pumpWidget(
      _createTestActionButtons(mockEmployeeBloc),
    );

    // tap clear button
    await tester.tap(find.byKey(clearButtonKey));
    await tester.pump();

    // validate that the bloc was called
    verifyNever(mockEmployeeBloc.add(EmployeeListEvent.load));
    verify(mockEmployeeBloc.add(EmployeeListEvent.clear)).called(1);
  });
}

/// Creates the Widget tree used for most action button testing
Widget _createTestActionButtons(EmployeeBloc mockEmployeeBloc) {
  return BlocProvider.value(
    value: mockEmployeeBloc,
    child: MaterialApp(
      home: Scaffold(
        body: ActionButtons(),
      ),
    ),
  );
}
