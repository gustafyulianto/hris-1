part of 'employee_bloc.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();
  
  @override
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState {
}
class EmployeeLoading extends EmployeeState {
  const EmployeeLoading();
  @override
  List<Object> get props => null;
}

class EmployeeLoaded extends EmployeeState {
  final ModelEmployee employeeModel;
  EmployeeLoaded(this.employeeModel);
  @override 
  List<Object> get props => [employeeModel];
}

class EmployeeError extends EmployeeState {
  final String message;
  const EmployeeError(this.message);
  @override 
  List<Object> get props => [message];
}
