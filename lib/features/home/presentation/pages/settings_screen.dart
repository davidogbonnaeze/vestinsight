import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sailor/sailor.dart';
import 'package:vestinsight/features/login/presentation/bloc/bloc.dart';
import 'package:vestinsight/core/services/auth_service.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/bloc.dart';
import 'package:vestinsight/injection_container.dart';
import 'package:vestinsight/routes.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;
    final double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          iconSize: 25,
          color: Colors.black45,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            iconSize: 20,
            color: Colors.white,
            onPressed: () {},
          )
        ],
        title: Center(
          child: Text(
            'Settings',
            style: TextStyle(color: Colors.black45, fontSize: 20),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Color(0xFFF6F6F6)),
              height: _screenHeight < 600
                  ? _screenHeight * 0.08
                  : _screenHeight * 0.065,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[Text('Account')],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Routes.sailor.navigate('/edit_profile_screen',
                    transitions: [SailorTransition.slide_from_right]);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xffdddddd), width: 1))),
                height: _screenHeight < 600
                    ? _screenHeight * 0.08
                    : _screenHeight * 0.065,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xffdddddd), width: 1))),
                height: _screenHeight < 600
                    ? _screenHeight * 0.08
                    : _screenHeight * 0.065,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Change Password',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Color(0xFFF6F6F6)),
              height: _screenHeight < 600
                  ? _screenHeight * 0.08
                  : _screenHeight * 0.065,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[Text('Other')],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xffdddddd), width: 1))),
                height: _screenHeight < 600
                    ? _screenHeight * 0.08
                    : _screenHeight * 0.065,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Privacy Policy',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xffdddddd), width: 1))),
                height: _screenHeight < 600
                    ? _screenHeight * 0.08
                    : _screenHeight * 0.065,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Contact Us',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xffdddddd), width: 1))),
                height: _screenHeight < 600
                    ? _screenHeight * 0.08
                    : _screenHeight * 0.065,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'About App',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                BlocProvider.of<UserAuthBloc>(context).add(LogOutEvent());
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xffdddddd), width: 1))),
                height: _screenHeight < 600
                    ? _screenHeight * 0.08
                    : _screenHeight * 0.065,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
