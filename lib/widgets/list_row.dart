import 'package:flutter/material.dart';
import 'package:hris/models/albums_list.dart';
import 'package:hris/widgets/txt.dart';

class ListRow extends StatelessWidget {
  //
  final Album album;
  ListRow({this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Txt(text: album.employee_name),
          Divider(),
        ],
      ),
    );
  }
}
