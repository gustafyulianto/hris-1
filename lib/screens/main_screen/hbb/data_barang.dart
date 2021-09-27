import 'package:hris/bloc/barang/barang_bloc.dart';
import 'package:hris/models/barang_model.dart';
import 'package:hris/style/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarangPage extends StatefulWidget {
  @override
  _BarangPageState createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  final BarangBloc _barangBloc = BarangBloc();


  @override
  void initState() {
    _barangBloc.add(GetBarangList());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Barang List',),backgroundColor: bgColor,),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _barangBloc,
        child: BlocListener<BarangBloc, BarangState>(
          listener: (context, state) {
            if (state is BarangError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<BarangBloc, BarangState>(
            builder: (context, state) {
              if (state is BarangInitial) {
                return _buildLoading();
              } else if (state is BarangLoading) {
                return _buildLoading();
              } else if (state is BarangLoaded) {
                return _buildCard(context, state.barangModel);
              } else if (state is BarangError) {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, ModelBarang model) {
    return ListView.builder(
      itemCount: model.data.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("ID: ${model.data[index].id}"),
                  Text(
                      "Serial Number: ${model.data[index].sn}"),
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
