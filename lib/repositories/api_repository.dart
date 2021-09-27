import 'package:hris/models/barang_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();


  Future<ModelBarang> fetchDataBarangList(){
    return _provider.fetchDataBarangList();
  }

  
}

class NetworkError extends Error {}
