import 'package:example_proj/bloc/employee_bloc.dart';
import 'package:example_proj/widgets/staff_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock/mock_data.dart';

void main() {
  EmployeeBloc mockBloc;

  setUp(() {
    mockBloc = MockEmployeeBloc();
  });

  testWidgets("Test that staff list exists", (WidgetTester tester) async {
    when(mockBloc.state).thenAnswer((_) => MockEmployee.getMockEmployeeList());

    // build StaffList
    await tester.pumpWidget(
      BlocProvider.value(
        value: mockBloc,
        child: MaterialApp(
          home: Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(child: StaffList()),
              ],
            ),
          ),
        ),
      ),
    );

    // find elements
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(3));

    // validate ListTile text
    expect(find.text("Henry Doe"), findsOneWidget);
    expect(find.text("Katie Doe"), findsOneWidget);
    expect(find.text("Martha Doe"), findsOneWidget);
  });
}
