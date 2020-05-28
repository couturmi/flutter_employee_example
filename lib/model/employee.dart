class Employee {
  int id;
  String name;
  int salary;
  int age;

  /// Private Constructor
  Employee._();

  Employee.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? int.parse(json['id']) : 0,
        name = json['employee_name'],
        salary = json['employee_salary'] != null
            ? int.parse(json['employee_salary'])
            : 0,
        age =
            json['employee_age'] != null ? int.parse(json['employee_age']) : 0;

  @override
  String toString() {
    return "$id:$name";
  }
}
