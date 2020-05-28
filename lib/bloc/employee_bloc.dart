import 'package:example_proj/model/employee.dart';
import 'package:example_proj/services/employee_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum EmployeeListEvent { load, clear }

class EmployeeBloc extends Bloc<EmployeeListEvent, List<Employee>> {
  List<Employee> _loadedEmployeeList;

  @override
  List<Employee> get initialState => [];

  @override
  Stream<List<Employee>> mapEventToState(EmployeeListEvent event) async* {
    switch (event) {
      case EmployeeListEvent.load:
        if (null == _loadedEmployeeList) {
          _loadedEmployeeList = await EmployeeService().getEmployees();
        }
        yield _loadedEmployeeList;
        break;
      case EmployeeListEvent.clear:
        yield [];
        break;
    }
  }
}
