import 'package:example_proj/bloc/employee_bloc.dart';
import 'package:example_proj/widgets/staff_list/action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock/mock_data.dart';

main() {
  EmployeeBloc mockBloc;

  setUp(() {
    mockBloc = MockEmployeeBloc();
  });

  testWidgets("Test Action Buttons are visible", (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider.value(
        value: mockBloc,
        child: MaterialApp(
          home: Scaffold(
            body: ActionButtons(),
          ),
        ),
      ),
    );

    expect(find.byType(RaisedButton), findsNWidgets(2));
    expect(find.text("Load"), findsOneWidget);
    expect(find.text("Clear"), findsOneWidget);
  });
}
