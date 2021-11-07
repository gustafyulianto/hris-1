import 'package:hris/models/employee_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();


  Future<ModelEmployee> fetchDataEmployeeList(){
    return _provider.fetchDataEmployeeList();
  }
}

class NetworkError extends Error {}
