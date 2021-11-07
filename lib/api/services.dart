import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hris/models/albums_list.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;

abstract class AlbumsRepo {
  Future<List<Album>> getAlbumList();
}

class AlbumServices implements AlbumsRepo {
  //
  static const _baseUrl = 'node.pgncom.co.id:1700';
  static const String _GET_ALBUMS = '/employeedetail';
  // final Dio _dio = Dio();

  // static String mainUrl = "http://node.pgncom.co.id:1700";
  // var urlEmployee = '$mainUrl/employeedetail';


  @override
  Future<List<Album>> getAlbumList() async {

    // var token = await storage.FlutterSecureStorage().read(key: 'token');
    //   (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //       (HttpClient client) {
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;
    //     return client;
    //   };
      
  
    Uri uri = Uri.http(_baseUrl, _GET_ALBUMS);
    // Response response = await http.get(uri);
    String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTYzNTkzOTIzOCwiZXhwIjoxNjM2NTQ0MDM4fQ.VtDfyhibcRRPdK32cFTXeEHm-q7Gh72YXcZY9ovqMdI';
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.body);
    List<Album> albums = albumFromJson(response.body);
    return albums;
  }
}
