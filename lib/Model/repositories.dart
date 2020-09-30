import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

abstract class EmployeeRepository {
  Future<List<EmployeeData>> getEmployeData();
}

class Respositories implements EmployeeRepository {
  @override
  Future<List<EmployeeData>> getEmployeData() async {
    String link = "http://dummy.restapiexample.com/api/v1/employees";
    var response = await http.get(link);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<EmployeeData> datas = Datas.fromJson(data).datas;
      return datas;
    } else {
      throw Exception();
    }
  }
}
