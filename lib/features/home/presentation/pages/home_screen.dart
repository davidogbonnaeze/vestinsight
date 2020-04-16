import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vestinsight/features/home/presentation/pages/dashboard_screen.dart';
import 'package:vestinsight/features/home/presentation/pages/add_investment_screen.dart';
import 'package:vestinsight/features/home/presentation/pages/explore_investments_screen.dart';
import 'package:vestinsight/features/home/presentation/pages/notifications_screen.dart';
import 'package:vestinsight/features/home/presentation/pages/user_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseUser currentUser;

  HomeScreen({this.currentUser});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentScreen = 0;

  final List<Widget> _appScreens = [
    DashBoardScreen(),
    ExploreInvestmentsScreen(),
    AddInvestmentsScreen(),
    NotificationsScreen(),
    UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _appScreens[_currentScreen]),
      bottomNavigationBar: Container(
        height: 70,
        child: CupertinoTabBar(
            onTap: onTabTapped,
            currentIndex: _currentScreen,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.blueAccent.shade400.withOpacity(.6),
                        Theme.of(context).primaryColor,
                      ],
                    ).createShader(bounds);
                  },
                  child: Icon(Icons.dashboard, color: Colors.white),
                ),
                icon: Icon(Icons.dashboard, color: Colors.grey),
              ),
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.blueAccent.shade400.withOpacity(.6),
                        Theme.of(context).primaryColor,
                      ],
                    ).createShader(bounds);
                  },
                  child: Icon(
                    Icons.assessment,
                    color: Colors.white,
                  ),
                ),
                icon: Icon(Icons.assessment, color: Colors.grey),
              ),
              BottomNavigationBarItem(
                  activeIcon: Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.blueAccent.shade400.withOpacity(.6),
                          Theme.of(context).primaryColor,
                        ],
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  icon: Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.grey,
                          Colors.grey,
                        ],
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  )),
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.blueAccent.shade400.withOpacity(.6),
                        Theme.of(context).primaryColor,
                      ],
                    ).createShader(bounds);
                  },
                  child: Icon(Icons.notifications, color: Colors.white),
                ),
                icon: Icon(Icons.notifications, color: Colors.grey),
              ),
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.blueAccent.shade400.withOpacity(.6),
                        Theme.of(context).primaryColor,
                      ],
                    ).createShader(bounds);
                  },
                  child: Icon(Icons.person, color: Colors.white),
                ),
                icon: Icon(Icons.person, color: Colors.grey),
              ),
            ]),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }
}
