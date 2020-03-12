import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  bool loggingIn = false;

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
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/login_illustration.png'),
                )),
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
                                    suffixIcon: GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
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
                                    suffixIcon: GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
                                    hintText: 'Password',
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
                                  validator: (input) => input.length < 6
                                      ? 'password must be more than 6 characters'
                                      : null,
                                  onSaved: (input) => _password = input,
                                  obscureText: true,
                                ),
                              ),
                              Container(
                                height: 20,
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  child: Text(
                                    'Forgot your password?',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(height: 100),
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
                                          'Login',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(
                                      color: Color(0xFF3D4C63),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () {
                                      print('sss');
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  )
                                ],
                              )
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
    }
  }
}
