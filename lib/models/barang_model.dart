class ModelBarang {
  int status_code;
  String status;
  List<ModelBarangResult> data;
  String error;

  ModelBarang({this.status, this.status_code, this.data});

  ModelBarang.withError(String errorMessage) {
    error = errorMessage;
  }

  factory ModelBarang.fromJson(Map<String, dynamic> json) {
    List<ModelBarangResult> data = (json['data'] as List)
        .map((resultTicketJson) => ModelBarangResult.fromJson(resultTicketJson))
        .toList();

    return ModelBarang(
      data: data,
      status: json['status'],
      status_code: json['status_code'],
    );
  }
}

class ModelBarangResult {
  final String id;
  final String sn;

  ModelBarangResult({
    this.id,
    this.sn
  });

  factory ModelBarangResult.fromJson(Map<String, dynamic> json) {
    return new ModelBarangResult(
      id: json['id'],
      sn: json['sn'],
    );
  }

  
}