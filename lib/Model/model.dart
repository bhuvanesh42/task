class Datas {
  String status;
  String message;
  List<EmployeeData> datas;

  Datas({this.status, this.datas, this.message});

  Datas.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      datas = new List<EmployeeData>();
      json['data'].forEach((v) {
        datas.add(new EmployeeData.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.datas != null) {
      data['data'] = this.datas.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class EmployeeData {
  String id;
  String name;
  String salary;
  String age;
  String image;

  EmployeeData({this.id, this.name, this.salary, this.age, this.image});

  EmployeeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['employee_name'];
    salary = json['employee_salary'];
    age = json['employee_age'];
    image = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_name'] = this.name;
    data['employee_salary'] = this.salary;
    data['employee_age'] = this.age;
    data['profile_image'] = this.image;
    return data;
  }
}
