import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hris/models/employee_model.dart';
import 'package:hris/repositories/api_repository.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
   ApiRepository _apiRepository = ApiRepository();
  EmployeeBloc() : super(EmployeeInitial()); 


  @override
  Stream<EmployeeState> mapEventToState(EmployeeEvent event) async* {
     if (event is GetEmployeeList) {
      try {
        yield EmployeeLoading();
        final mList = await _apiRepository.fetchDataEmployeeList();
        print(mList);
        // yield EmployeeLoaded(mList);
        if (mList.error != null) {
          yield EmployeeError(mList.error);
        }
      } on NetworkError {
        yield EmployeeError(
            "Gagal Fetch Data , Pastikan anda terkoneksi Internet.");
      }
    }
  }
}
