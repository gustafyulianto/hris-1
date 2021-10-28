import 'package:hris/bloc/auth_bloc/auth.dart';
import 'package:hris/screens/main_screen/view_dashboard.dart';
import 'package:hris/screens/main_screen/view_graph.dart';
import 'package:hris/screens/main_screen/view_history.dart';
import 'package:hris/screens/main_screen/view_setting.dart';
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
      // appBar: AppBar(
      //   backgroundColor: bgColor,
      //   title: Center(child: Text("HRIS APPLICATION")),
      //   actions: [
      //     IconButton(icon: Icon(EvaIcons.logOutOutline), onPressed: () {
      //       BlocProvider.of<AuthenticationBloc>(context).add(
      //                     LoggedOut(),
      //                   );
      //     })
      //   ],
      // ),
        body: Center(
          child: BlocProvider(
            create: (context) => ChangeHome(
              repositoryHome: RepositoryHome(
                changeHomeProvider: ChangeHomeProvider(
                  homePage: HomePage.Knowledge,
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
                      ViewHistory(),
                      ViewSetting()
                    ],
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    selectedItemColor: Colors.blueAccent,
                    unselectedItemColor: Colors.black54,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    unselectedFontSize: 12,
                    selectedFontSize: 12,
                    type: BottomNavigationBarType.fixed,
                elevation: 10.0,
                    currentIndex: state,
                    onTap: (value) {
                      context.read<ChangeHome>().add(
                        value == 0
                            ? HomePage.Overview
                            : value == 1
                            ? HomePage.Knowledge
                            : value == 2
                            ? HomePage.Employees
                            : HomePage.Account,
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
