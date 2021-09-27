import 'package:hris/bloc/auth_bloc/auth.dart';
import 'package:hris/screens/main_screen/view_dashboard.dart';
import 'package:hris/screens/main_screen/view_graph.dart';
import 'package:hris/style/components.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hris/style/theme.dart' as Style;
import 'package:hris/bloc/home/home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Center(child: Text("Aplikasi Monitoring")),
        actions: [
          IconButton(icon: Icon(EvaIcons.logOutOutline), onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(
                          LoggedOut(),
                        );
          })
        ],
      ),
        body: Center(
          child: BlocProvider(
            create: (context) => ChangeHome(
              repositoryHome: RepositoryHome(
                changeHomeProvider: ChangeHomeProvider(
                  homePage: HomePage.HomeGraph,
                ),
              ),
            ),
            child: BlocBuilder<ChangeHome, int>(
              builder: (context, state) {
                return Scaffold(
                  body: IndexedStack(
                    index: state,
                    children: [
                      ViewDashboard(),
                      ViewGraph(),
                      Center(
                        child: Text("History"),
                      ),
                      Center(
                        child: Text("Setting"),
                      ),
                    ],
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    selectedItemColor: Colors.black,
                    currentIndex: state,
                    onTap: (value) {
                      context.read<ChangeHome>().add(
                        value == 0
                            ? HomePage.HomePopular
                            : value == 1
                            ? HomePage.HomeGraph
                            : value == 2
                            ? HomePage.HomeHistory
                            : HomePage.HomeSetting,
                      );
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.dashboard,
                          color: Colors.black38,
                        ),
                        label: ("Dashboard"),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.graphic_eq,
                          color: Colors.black38,
                        ),
                        label: ("Graph"),
                        
                      
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.history,
                          color: Colors.black38,
                        ),
                        label: ("History"),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.black38,
                        ),
                        label: ("Setting"),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        )
      /*body: Center(
        child: Text("Main Screen"),
      )*/
    );
  }
}
