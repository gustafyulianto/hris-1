import 'package:flutter/material.dart';
import 'package:hris/utils/widget-model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ViewGraph extends StatefulWidget {
  @override
  _ViewGraphState createState() => _ViewGraphState();
}

class _ViewGraphState extends State<ViewGraph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Container(
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 4,
            automaticallyImplyLeading: false,
            title: GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        dynamicText("Lorem Ipsum's account", fontWeight: FontWeight.w600),
                        Icon(Icons.arrow_drop_down, color: Colors.black,),
                      ]
                    ),
                    dynamicText("Recomendations", fontSize: 12, color: Colors.black45),
                  ],
                ),
              ),
              onTap: () {
                // navigationManager(context, Profile(), isPushReplaced: false);
              },
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10, top: 10),
                child: GestureDetector(
                  child: Icon(Icons.notifications_outlined, color: Colors.black45, size: 30,),
                  onTap: () {
                    // navigationManager(context, NotificationScreen(), isPushReplaced: false);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(12, 14, 12, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: LinearPercentIndicator(
                          // width: 100.0,
                          lineHeight: 10.0,
                          percent: 0.21,
                          backgroundColor: Colors.grey[300],
                          progressColor: Colors.blueAccent,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: dynamicText(
                        "Lets start your campaign! How do you get new customer?", 
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center
                      )
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: dynamicText(
                        "Improve your score by following the recomendations", 
                        fontSize: 14, 
                        color: Colors.black45,
                        textAlign: TextAlign.center
                      ),
                    ),

                    
                  ],
                ),
              ),
            )
    );
  }
}