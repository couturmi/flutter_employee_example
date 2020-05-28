import 'package:example_proj/model/employee.dart';
import 'package:example_proj/services/employee_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../mock/mock_data.dart';

main() {
  group('get employees', () {
    test('successful', () async {
      // create mock client
      final MockHttpClient client = MockHttpClient();
      when(client.get(EmployeeService.EMPLOYEE_GET_ALL_URL)).thenAnswer(
          (_) async => http.Response(MockEmployee.EMPLOYEE_LIST_RESPONSE, 200));

      // test service
      List<Employee> employeeList =
          await EmployeeService().getEmployees(client);
      expect(employeeList, isNotEmpty);
      expect(employeeList[0].id, 1);
      expect(employeeList[0].name, "Henry Doe");
      expect(employeeList[0].salary, 320800);
      expect(employeeList[0].age, 61);
    });
    test('with error', () async {
      // create mock client
      final MockHttpClient client = MockHttpClient();
      when(client.get(EmployeeService.EMPLOYEE_GET_ALL_URL))
          .thenAnswer((_) async => http.Response("Not Found", 404));

      // test service
      expect(EmployeeService().getEmployees(client), throwsException);
    });
  });
}
