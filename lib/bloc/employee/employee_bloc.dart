import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hris/models/employee_model.dart';
import 'package:hris/repositories/api_provider.dart';
import 'package:hris/repositories/api_repository.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {

  final ModelEmployeesRepo modelemloyeessRepo;
  List<ModelEmployee> employeeModel;

   EmployeeBloc({this.modelemloyeessRepo}) : super(EmployeeInitial());
   ApiRepository _apiRepository = ApiRepository();
  //  EmployeeBloc() : super(EmployeeInitial()); 
   


  @override
  Stream<EmployeeState> mapEventToState(EmployeeEvent event) async* {
     if (event is GetEmployeeList) {
      try {
        yield EmployeeLoading();
        final employeeModel = await modelemloyeessRepo.getModelEmployeeList();
        print(employeeModel);
        yield EmployeeLoaded(employeeModel);
        if (employeeModel.isEmpty != null) {
          // yield EmployeeError(employeeModel);
        }
      } on NetworkError {
        yield EmployeeError(
            "Gagal Fetch Data , Pastikan anda terkoneksi Internet.");
      }
    }
  }
}
