import 'package:example_proj/bloc/employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Widget containing the group of buttons responsible for controlling the state of the displayed list
class ActionButtons extends StatelessWidget {
  static const String LOAD_BUTTON_KEY_ID = "ActionsLoadButton";
  static const String CLEAR_BUTTON_KEY_ID = "ActionsClearButton";

  final Key _loadButtonKey = Key(LOAD_BUTTON_KEY_ID);
  final Key _clearButtonKey = Key(CLEAR_BUTTON_KEY_ID);
  @override
  Widget build(BuildContext context) {
    final EmployeeBloc employeeBloc = BlocProvider.of<EmployeeBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          key: _loadButtonKey,
          child: Text("Load"),
          onPressed: () {
            employeeBloc.add(EmployeeListEvent.load);
          },
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        RaisedButton(
          key: _clearButtonKey,
          child: Text("Clear"),
          onPressed: () {
            employeeBloc.add(EmployeeListEvent.clear);
          },
          color: Colors.deepOrangeAccent,
        ),
      ],
    );
  }
}
