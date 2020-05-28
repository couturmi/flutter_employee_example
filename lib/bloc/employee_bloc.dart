import 'package:example_proj/model/employee.dart';
import 'package:example_proj/services/employee_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum EmployeeListEvent { load, clear }

class EmployeeBloc extends Bloc<EmployeeListEvent, List<Employee>> {
  @override
  List<Employee> get initialState => [];

  @override
  Stream<List<Employee>> mapEventToState(EmployeeListEvent event) async* {
    switch (event) {
      case EmployeeListEvent.load:
        yield await EmployeeService().getEmployees();
        break;
      case EmployeeListEvent.clear:
        yield [];
        break;
    }
  }
}
