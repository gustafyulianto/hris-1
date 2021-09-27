import 'package:hris/style/components.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final name;
  final image;
  final route;
  ItemCard(this.name, this.image, this.route);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => route));
        },
        child: Container(
          height: 130.0,
          width: 140.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.white.withOpacity(0.8),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16.0,
              ),
              Container(
                width: 60.0,
                height: 60.0,
                child: Image.asset(
                  image,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                name,
                style: TextStyle(
                  color: bgColor,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              // Text(
              //   subTitle,
              //   style: TextStyle(
              //       color: Colors.white.withOpacity(0.6), fontSize: 12.0),
              // ),
              // SizedBox(
              //   height: 4.0,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}