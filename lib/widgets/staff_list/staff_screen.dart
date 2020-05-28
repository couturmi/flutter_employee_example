import 'package:example_proj/bloc/employee_bloc.dart';
import 'package:example_proj/bloc/view_type_bloc.dart';
import 'package:example_proj/widgets/staff_list/action_buttons.dart';
import 'package:example_proj/widgets/staff_list/staff_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Screen to display the employee data
class StaffScreen extends StatelessWidget {
  final ViewType _viewType;

  StaffScreen(this._viewType);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmployeeBloc>(
          create: (context) => EmployeeBloc(),
        ),
        BlocProvider<ViewTypeBloc>(
          create: (context) => ViewTypeBloc(_viewType),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(_getAppBarTitle(_viewType)),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ActionButtons(),
            Expanded(child: StaffList()),
          ],
        ),
      ),
    );
  }

  /// Generate the AppBar title based on the current ViewType
  String _getAppBarTitle(ViewType viewType) {
    if (viewType == ViewType.manager) {
      return "Staff Roster (Manager)";
    }
    return "Staff Roster";
  }
}
