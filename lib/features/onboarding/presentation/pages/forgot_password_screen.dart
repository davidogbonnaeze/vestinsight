import 'package:flutter/material.dart';

import '../../../../routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  bool loggingIn = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDF1F9),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
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
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Flexible(
                        child: Text(
                          'Enter your registrated email address to receive password reset instruction',
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Color(0xFF3D4C63),
                                    fontSize: 16,
                                  ),
                                  cursorColor: Color(0xFF3D4C63),
                                  decoration: InputDecoration(
                                    hintText: 'Email address',
                                    hintStyle:
                                        TextStyle(color: Color(0xFF3D4C63)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 1.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF3D4C63), width: 0.3),
                                    ),
                                  ),
                                  validator: (input) => !input.contains('@')
                                      ? 'please enter a valid email'
                                      : null,
                                  onSaved: (input) => _email = input,
                                ),
                              ),
                              SizedBox(height: 50),
                              Container(
                                width: 200,
                                height: 60,
                                padding: EdgeInsets.all(10),
                                child: FlatButton(
                                  shape: StadiumBorder(),
                                  onPressed: _submit,
                                  color: Theme.of(context).primaryColor,
                                  child: loggingIn
                                      ? Container(
                                          height: 16,
                                          width: 16,
                                          child: CircularProgressIndicator(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            valueColor:
                                                new AlwaysStoppedAnimation<
                                                    Color>(Colors.white),
                                          ),
                                        )
                                      : Text(
                                          'Reset Password',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        loggingIn = true;
      });
      await Future.delayed(Duration(milliseconds: 2000));

      setState(() {
        loggingIn = false;
      });
      Routes.sailor.navigate('/check_email_screen');
    }
  }
}
