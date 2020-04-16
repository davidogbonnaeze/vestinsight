import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vestinsight/features/home/presentation/pages/home_screen.dart';
import 'package:vestinsight/features/login/presentation/pages/login_screen.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/bloc.dart';
import 'package:vestinsight/features/onboarding/presentation/pages/walkthrough_screens.dart';
import 'package:vestinsight/injection_container.dart';
import 'package:vestinsight/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
//    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0);
    if (counter < 1) {
      counter++;
      prefs.setInt('counter', counter);
      return Timer(duration, () {
        Routes.sailor.navigate('/walkthrough_screen');
      });
    } else {
      Routes.sailor.navigate('/login_screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Icon(Icons.trending_up, size: 40, color: Colors.white),
      ),
    );
  }
}
