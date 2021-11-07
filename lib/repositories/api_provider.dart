import 'dart:io';

import 'package:hris/models/employee_model.dart';
import 'package:hris/repositories/repositories.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  final Dio _dio = Dio();

  // final _urlEmployee = Uri.parse('http://node.pgncom.co.id:1700/employeedetail');
  // final String urlEmployee = 'http://node.pgncom.co.id:1700/employeedetail';

  static String mainUrl = "http://node.pgncom.co.id:1700";
  var urlEmployee = '$mainUrl/employeedetail';

  Future<ModelEmployee> fetchDataEmployeeList() async {
    try {
      var token = await storage.FlutterSecureStorage().read(key: 'token');
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      
      Response response = await _dio.get(urlEmployee,
          options: Options(headers: {
            'Authorization': 'Bearer $token'
                // 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJ1c2VybmFtZSI6ImJhaW0iLCJpYXQiOjE2MjE0NzY3MjksImV4cCI6MTYyMTUxOTkyOX0.JjPB0WobY2qAebv5mB7zP_2Eceo0P3qAGrziwPizYTg'
          }));
          
      // print(response.data[0]);    
      return ModelEmployee.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ModelEmployee.withError("Data API not found / Connection issue");
    }
  }
}
