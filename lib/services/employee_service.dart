import 'dart:convert';

import 'package:example_proj/model/employee.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  static const String EMPLOYEE_GET_ALL_URL =
      "http://dummy.restapiexample.com/api/v1/employees";

  /// Return list of employees
  Future<List<Employee>> getEmployees([http.Client client]) async {
    // create client if not supplied
    if (client == null) {
      client = http.Client();
    }
    // make http request
    var response = await client.get(EMPLOYEE_GET_ALL_URL);
    Map responseJson = jsonDecode(response.body);
    if (response.statusCode >= 400 || responseJson["status"] != "success") {
      throw Exception("Could not retrieve Employees");
    }
    client.close();
    // parse data and return
    List employeeJsonList = responseJson["data"];
    return employeeJsonList.map((json) => Employee.fromJson(json)).toList();
  }
}
