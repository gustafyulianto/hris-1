import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hris/bloc/auth_bloc/auth.dart';
import 'package:hris/utils/constant.dart';

class ViewSetting extends StatefulWidget {
  const ViewSetting({Key key}) : super(key: key);

  @override
  _ViewSettingState createState() => _ViewSettingState();
}

class _ViewSettingState extends State<ViewSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        ListTile(
          onTap: () {
            BlocProvider.of<AuthenticationBloc>(context).add(
              LoggedOut(),
            );
          },
          trailing: Icon(EvaIcons.logOutOutline),
          title: Text('Logout',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold)),
        )
      ],
    ));
  }
}
