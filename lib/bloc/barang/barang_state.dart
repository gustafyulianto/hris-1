part of 'barang_bloc.dart';

abstract class BarangState extends Equatable {
  const BarangState();
  
  @override
  List<Object> get props => [];
}

class BarangInitial extends BarangState {
  const BarangInitial();
  @override
  List<Object> get props => [];
}

class BarangLoading extends BarangState {
  const BarangLoading();
  @override
  List<Object> get props => null;
}

class BarangLoaded extends BarangState {
  final ModelBarang barangModel;
  const BarangLoaded(this.barangModel);
  @override 
  List<Object> get props => [barangModel];
}

class BarangError extends BarangState {
  final String message;
  const BarangError(this.message);
  @override 
  List<Object> get props => [message];
}
