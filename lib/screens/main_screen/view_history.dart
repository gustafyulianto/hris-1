import 'package:flutter/material.dart';
import 'package:hris/utils/widget-model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ViewHistory extends StatefulWidget {
  @override
  _ViewHistoryState createState() => _ViewHistoryState();
}

class _ViewHistoryState extends State<ViewHistory> {
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
          // height: MediaQuery.of(context).size.height - 150,
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(
            children: [
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    defaultButtonTab(
                      Row(
                        children: [
                          dynamicText("Clicks", fontSize: 10),
                          SizedBox(width: 4),
                          dynamicText("130K", fontSize: 14, fontWeight: FontWeight.w600),
                        ],
                      )
                    ),
                    defaultButtonTab(
                      Row(
                        children: [
                          dynamicText("Costs", fontSize: 10),
                          SizedBox(width: 4),
                          dynamicText("\$40.3", fontSize: 14, fontWeight: FontWeight.w600),
                        ],
                      )
                    ),
                    defaultHighlightButtonTab(
                      Row(
                        children: [
                          dynamicText("Improvements", fontSize: 10, color: Colors.white),
                          SizedBox(width: 4),
                          dynamicText("180K", fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                        ],
                      )
                    ),
                    defaultButtonTab(
                      Row(
                        children: [
                          dynamicText("Balance", fontSize: 10),
                          SizedBox(width: 4),
                          dynamicText("10K", fontSize: 14, fontWeight: FontWeight.w600),
                        ],
                      )
                    ),
                    
                  ],
                ),
              ),

              defaultCard(
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 14.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 4),
                            child: dynamicText("81.3%", fontSize: 30, fontWeight: FontWeight.w600, color: Colors.blueAccent),
                          ),
                          
                          LinearPercentIndicator(
                            width: 100.0,
                            lineHeight: 14.0,
                            percent: 0.81,
                            backgroundColor: Colors.grey[300],
                            progressColor: Colors.blueAccent,
                          ),
                          SizedBox(height: 10,)
                        ],
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: dynamicText("Optimization score", fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                              child: Icon(Icons.info_outline, color: Colors.black45, size: 18,),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(0),
                          width: 200,
                          child: dynamicText("Improve your score by following the recomendations below ", fontSize: 12, color: Colors.black45),
                        ),
                      ],
                    ),
                    // dynamicText("tes")
                  ],
                ),
              ),

              defaultCard(
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding: EdgeInsets.all(4),
                              child: Icon(Icons.search, size: 14, color: Colors.white,),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6, bottom: 4),
                              child: dynamicText("Bid more efficiently with Target CPA", fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            defaultChip("+3.2%"),
                            Padding(
                              padding: EdgeInsets.only(left: 4, bottom: 4),
                              child: Icon(Icons.more_vert_outlined),
                            ),
                          ],
                        ),

                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: dynamicText("Lower your cost and get the same number of conversation with fully", fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: dynamicText("Improve your score by following the recomendations below. Recomended because you're not targetting", fontSize: 12, color: Colors.black45),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: dynamicText("-\$30.4", fontSize: 14, color: Colors.green, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: defaultFlatButton(
                                "View More",
                                () {}
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: defaultRaisedButton(
                                "Apply",
                                () {}
                              )
                              
                            ),

                          ],
                        ),
                      ],
                    ),
                    // dynamicText("tes")
                  ],
                ),
              ),

              defaultCard(
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding: EdgeInsets.all(4),
                              child: Icon(Icons.bar_chart_outlined, size: 14, color: Colors.white,),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6, bottom: 4),
                              child: dynamicText("New Keyword", fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            defaultChip("+3.2%"),
                            Padding(
                              padding: EdgeInsets.only(left: 4, bottom: 4),
                              child: Icon(Icons.more_vert_outlined),
                            ),
                          ],
                        ),

                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: dynamicText("Show your ads more often to people searching what your business offers", fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              defaultImageThumb('https://picsum.photos/250?image=13'),
                              defaultImageThumb('https://picsum.photos/250?image=11'),
                              defaultImageThumb('https://picsum.photos/250?image=10'),
                              // defaultImageThumb(Icon(Icons.image, color: Colors.blueAccent)),
                            ]
                          )
                        ),
                        
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: defaultRaisedButton(
                            "Collect All",
                            () {}
                          )
                          
                        ),
                      ],
                    ),
                    // dynamicText("tes")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}