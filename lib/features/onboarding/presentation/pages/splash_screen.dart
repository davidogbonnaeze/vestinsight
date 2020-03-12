import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vestinsight/features/onboarding/presentation/pages/walkthrough_screens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return WalkThroughScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash-logo.png'),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
