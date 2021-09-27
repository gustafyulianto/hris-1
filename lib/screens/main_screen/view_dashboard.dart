import 'package:hris/style/components.dart';
import 'package:flutter/material.dart';

import 'hbb/data_barang.dart';
import 'item/item_card.dart';

class ViewDashboard extends StatefulWidget {
  ViewDashboard({Key key}) : super(key: key);

  @override
  _ViewDashboardState createState() => _ViewDashboardState();
}

class _ViewDashboardState extends State<ViewDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
                children: <Widget>[
                  

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20/812.0 * MediaQuery.of(context).size.height),
                        // ProfileSection('$nama', widget.callback),
                        SizedBox(height: 40/812.0 * MediaQuery.of(context).size.height),
                       
                        HeaderText('HBB'),
                        SizedBox(height: 8.0),
                        ThirdListView(),
                        SizedBox(height: 16.0),
                      ],
                    ),
                  )
                ],
              ),
    );
  }
}

class HeaderText extends StatelessWidget {
  final title;
  HeaderText(this.title);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: bgColor, fontSize: 16.0, fontWeight: FontWeight.w500),
    );
  }
}
class ThirdListView extends StatelessWidget {
  const ThirdListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ItemCard('Data Barang', './assets/001-documents.png', BarangPage()),

          
          // ItemCard('PhotoShop', photoshop, 'Photoshop', '782'),
          // ItemCard('Slack', slack, 'Business', '1350'),
        ],
      ),
    );
  }
}