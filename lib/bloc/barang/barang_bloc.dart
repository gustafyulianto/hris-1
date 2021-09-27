import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hris/models/barang_model.dart';
import 'package:hris/repositories/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'barang_event.dart';
part 'barang_state.dart';

class BarangBloc extends Bloc<BarangEvent, BarangState> {
  ApiRepository _apiRepository = ApiRepository();
  BarangBloc() : super(BarangInitial());

  @override
  Stream<BarangState> mapEventToState(
    BarangEvent event,
  ) async* {
    if (event is GetBarangList) {
      try {
        yield BarangLoading();
        final mList = await _apiRepository.fetchDataBarangList();
        yield BarangLoaded(mList);
        if (mList.error != null) {
          yield BarangError(mList.error);
        }
      } on NetworkError {
        yield BarangError(
            "Gagal Fetch Data , Pastikan anda terkoneksi Internet.");
      }
    }
  }
}
