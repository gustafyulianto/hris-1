import 'package:hris/bloc/employee/employee_bloc.dart';
import 'package:hris/models/employee_model.dart';
import 'package:hris/style/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeePage extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();


  @override
  void initState() {
    _employeeBloc.add(GetEmployeeList());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employee List',),backgroundColor: bgColor,),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _employeeBloc,
        child: BlocListener<EmployeeBloc, EmployeeState>(
          listener: (context, state) {
            if (state is EmployeeError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<EmployeeBloc, EmployeeState>(
            builder: (context, state) {
              if (state is EmployeeInitial) {
                return _buildLoading();
              } else if (state is EmployeeLoading) {
                return _buildLoading();
              } else if (state is EmployeeLoaded) {
                return _buildCard(List<ModelEmployee> albums, state.employeeModel);
              } else if (state is EmployeeError) {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, ModelEmployee model) {
    return ListView.builder(
      itemCount: model.employee_id,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("ID: ${model.employee_id}"),
                  Text(
                      "Serial Number: ${model.employee_type}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
