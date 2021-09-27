import 'dart:io';

import 'package:hris/models/barang_model.dart';
import 'package:hris/repositories/repositories.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  final Dio _dio = Dio();

  
  

  final _urlHbb =
      Uri.parse('https://hbb.pgncom.co.id/index.php/api/Data/barang');
  final String urlHbb = 'https://hbb.pgncom.co.id/index.php/api/Data/barang';

  Future<ModelBarang> fetchDataBarangList() async {
    try {
      var token = await storage.FlutterSecureStorage().read(key: 'token');
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      
      Response response = await _dio.get(urlHbb,
          options: Options(headers: {
            HttpHeaders.authorizationHeader:
                // 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJ1c2VybmFtZSI6ImJhaW0iLCJpYXQiOjE2MjE0NzY3MjksImV4cCI6MTYyMTUxOTkyOX0.JjPB0WobY2qAebv5mB7zP_2Eceo0P3qAGrziwPizYTg'
          token
          }));

      return ModelBarang.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ModelBarang.withError("Data not found / Connection issue");
    }
  }
}
