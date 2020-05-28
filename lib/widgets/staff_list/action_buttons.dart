import 'package:example_proj/bloc/employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Widget containing the group of buttons responsible for controlling the state of the displayed list
class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EmployeeBloc employeeBloc = BlocProvider.of<EmployeeBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          child: Text("Load"),
          onPressed: () {
            employeeBloc.add(EmployeeListEvent.load);
          },
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        RaisedButton(
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
