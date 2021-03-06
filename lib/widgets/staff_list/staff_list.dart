import 'package:example_proj/bloc/employee_bloc.dart';
import 'package:example_proj/bloc/view_type_bloc.dart';
import 'package:example_proj/model/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Widget to display the list of staff
class StaffList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, List<Employee>>(
      builder: (context, state) {
        // retrieve the screen view type
        ViewType viewTypeBloc = BlocProvider.of<ViewTypeBloc>(context).state;
        // build the list
        return ListView.builder(
          itemCount: state?.length ?? 0,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.white : Colors.blue[50],
            child: ListTile(
              leading: Text(
                "ID: ${state[index].id}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(state[index].name),
                  // only display the Age and Salary fields if the ViewType is in Manager View
                  viewTypeBloc == ViewType.manager
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Age: ${state[index].age}",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              "Salary: \$${state[index].salary}",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            )
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
