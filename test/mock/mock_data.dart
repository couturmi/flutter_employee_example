import 'dart:convert';
import 'package:bloc_test/bloc_test.dart';
import 'package:example_proj/bloc/employee_bloc.dart';
import 'package:example_proj/bloc/view_type_bloc.dart';
import 'package:example_proj/model/employee.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockHttpClient extends Mock implements http.Client {}

class MockEmployeeBloc extends MockBloc<EmployeeListEvent, List<Employee>>
    implements EmployeeBloc {}

class MockViewTypeBloc extends MockBloc<ViewType, ViewType>
    implements ViewTypeBloc {}

class MockEmployee {
  static const EMPLOYEE_LIST_RESPONSE = "{\"status\":\"success\",\"data\":["
      "{\"id\":\"1\",\"employee_name\":\"Henry Doe\",\"employee_salary\":\"320800\",\"employee_age\":\"61\",\"profile_image\":\"\"},"
      "{\"id\":\"2\",\"employee_name\":\"Katie Doe\",\"employee_salary\":\"450000\",\"employee_age\":\"41\",\"profile_image\":\"\"},"
      "{\"id\":\"3\",\"employee_name\":\"Martha Doe\",\"employee_salary\":\"400200\",\"employee_age\":\"55\",\"profile_image\":\"\"}"
      "]}";
  static const EMPLOYEE_LIST_RESPONSE_EMPTY = "{\"status\":\"success\",\"data\":[]}";

  static List<Employee> getMockEmployeeList() {
    Map responseJson = jsonDecode(EMPLOYEE_LIST_RESPONSE);
    List employeeJsonList = responseJson["data"];
    return employeeJsonList.map((json) => Employee.fromJson(json)).toList();
  }
}
