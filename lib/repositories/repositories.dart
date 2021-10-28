import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  static String mainUrl = "http://node.pgncom.co.id:1700";
  var loginUrl = '$mainUrl/users/authenticate';
  final FlutterSecureStorage storage = new FlutterSecureStorage();
  final Dio _dio = Dio();
  
  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> readToken() async {
    var value = await storage.read(key: 'token');
    return value;
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login(String username, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "username": username,
      "password": password,
    });
    //return response.data['data']['user']["token"];
    // print(response);
    // print(loginUrl);
    return response.data["token"];

  }

}