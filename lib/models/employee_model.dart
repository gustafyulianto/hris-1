import 'dart:convert';

List<ModelEmployee> modelEmployeeFromJson(String str) =>
    List<ModelEmployee>.from(json.decode(str).map((x) => ModelEmployee.fromJson(x)));

String modelEmployeeToJson(List<ModelEmployee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelEmployee {
  // int StatusCode;
  // String status;
  // List<ModelEmployeeResult> data;
     String error;

  ModelEmployee({
    this.employee_id,
    this.employee_type,
  });

  // ModelEmployee({this.status, this.StatusCode, this.data});

  int employee_id;
  String employee_type;
  

  ModelEmployee.withError(String errorMessage) {
    error = errorMessage;
  }

  // factory ModelEmployee.fromJson(Map<String, dynamic> json) {
  //   print(json);
  //   List<ModelEmployeeResult> data;
  //   data = (json as List).map((resultTicketJson) => ModelEmployeeResult.fromJson(resultTicketJson)).toList();
  //   return ModelEmployee(
  //     data: data,
  //     status: json['employee_id'],
  //     StatusCode: json['employee_type'],
  //   );
  // }

  factory ModelEmployee.fromJson(Map<String, dynamic> json) => ModelEmployee(
        employee_id: json["employee_id"],
        employee_type: json["employee_type"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employee_id,
        "employee_type": employee_type,
      };

}

class ModelEmployeeResult {
  final String employee_id;
  final String employee_type;

  ModelEmployeeResult({
    this.employee_id,
    this.employee_type
  });

  factory ModelEmployeeResult.fromJson(Map<String, dynamic> json) {
    return new ModelEmployeeResult(
      employee_id: json['employee_id'],
      employee_type: json['employee_type'],
    );
  }

  
}