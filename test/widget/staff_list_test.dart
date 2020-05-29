import 'package:example_proj/bloc/employee_bloc.dart';
import 'package:example_proj/bloc/view_type_bloc.dart';
import 'package:example_proj/widgets/staff_list/staff_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock/mock_data.dart';

void main() {
  EmployeeBloc mockEmployeeBloc;
  ViewTypeBloc mockViewTypeBloc;

  setUp(() {
    mockEmployeeBloc = MockEmployeeBloc();
    mockViewTypeBloc = MockViewTypeBloc();
  });

  testWidgets("Test that staff list is created", (WidgetTester tester) async {
    when(mockEmployeeBloc.state)
        .thenAnswer((_) => MockEmployee.getMockEmployeeList());
    when(mockViewTypeBloc.state).thenAnswer((_) => ViewType.normal);

    // build StaffList
    await tester.pumpWidget(
      _createTestStaffList(mockEmployeeBloc, mockViewTypeBloc),
    );

    // find elements
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(3));

    // validate ListTile text
    expect(find.text("Henry Doe"), findsOneWidget);
    expect(find.text("Katie Doe"), findsOneWidget);
    expect(find.text("Martha Doe"), findsOneWidget);
  });

  testWidgets("Test staff list in Normal View", (WidgetTester tester) async {
    when(mockEmployeeBloc.state)
        .thenAnswer((_) => MockEmployee.getMockEmployeeList());
    when(mockViewTypeBloc.state).thenAnswer((_) => ViewType.normal);

    // build StaffList
    await tester.pumpWidget(
      _createTestStaffList(mockEmployeeBloc, mockViewTypeBloc),
    );

    // validate text that should be visible
    expect(find.text("ID: 1"), findsOneWidget);
    expect(find.text("Henry Doe"), findsOneWidget);

    // validate text that should not be visible
    expect(find.text("Age: 61"), findsNothing);
    expect(find.text("Salary: \$320800"), findsNothing);
  });

  testWidgets("Test staff list in Manager View", (WidgetTester tester) async {
    when(mockEmployeeBloc.state)
        .thenAnswer((_) => MockEmployee.getMockEmployeeList());
    when(mockViewTypeBloc.state).thenAnswer((_) => ViewType.manager);

    // build StaffList
    await tester.pumpWidget(
      _createTestStaffList(mockEmployeeBloc, mockViewTypeBloc),
    );

    // validate text that should be visible
    expect(find.text("ID: 1"), findsOneWidget);
    expect(find.text("Henry Doe"), findsOneWidget);
    expect(find.text("Age: 61"), findsOneWidget);
    expect(find.text("Salary: \$320800"), findsOneWidget);
  });
}

/// Creates the widget tree used for basic testing
Widget _createTestStaffList(
    EmployeeBloc mockEmployeeBloc, ViewTypeBloc mockViewTypeBloc) {
  return MultiBlocProvider(
    providers: [
      BlocProvider.value(
        value: mockEmployeeBloc,
      ),
      BlocProvider.value(
        value: mockViewTypeBloc,
      ),
    ],
    child: MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(child: StaffList()),
          ],
        ),
      ),
    ),
  );
}
