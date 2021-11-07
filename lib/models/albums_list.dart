import 'dart:convert';

List<Album> albumFromJson(String str) =>
    List<Album>.from(json.decode(str).map((x) => Album.fromJson(x)));

String albumToJson(List<Album> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Album {
  Album({
    this.employee_id,
    this.employee_type,
    this.employee_name,
  });

  int employee_id;
  String employee_type;
  String employee_name;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        employee_id: json["employee_id"],
        employee_type: json["employee_type"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employee_id,
        "employee_type": employee_type,
      };
}
