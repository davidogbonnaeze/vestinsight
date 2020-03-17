import 'package:flutter/material.dart';
import 'package:vestinsight/routes.dart';

class CheckEmailScreen extends StatefulWidget {
  @override
  _CheckEmailScreenState createState() => _CheckEmailScreenState();
}

class _CheckEmailScreenState extends State<CheckEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDF1F9),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.chevron_left),
                  iconSize: 25,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Check your Email',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Follow the password recovery instructions we have',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'just sent to your email address',
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/check_email.png'))),
              ),
            ),
            Container(
              height: 40,
              width: 200,
              child: FlatButton(
                shape: StadiumBorder(),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                child: Text('Back to Login'),
                onPressed: () => Routes.sailor.navigate('/login_screen'),
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
