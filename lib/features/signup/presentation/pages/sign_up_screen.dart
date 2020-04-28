import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/bloc.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/user_auth_bloc.dart';
import 'package:vestinsight/features/signup/presentation/bloc/bloc.dart';
import 'package:vestinsight/injection_container.dart';

import '../../../../routes.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _firstName;
  String _lastName;
  bool loggingIn = false;
  bool _obscureText = true;
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  SignUpBloc signUpBloc;

  @override
  Widget build(BuildContext context) {
    signUpBloc = sl<SignUpBloc>();
    _fieldFocusChange(
        BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

    return Scaffold(
      backgroundColor: Color(0xffEDF1F9),
      body: BlocProvider<SignUpBloc>(
        create: (_) => signUpBloc,
        child: BlocListener<SignUpBloc, SignUpState>(
          bloc: signUpBloc,
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              BotToast.closeAllLoading();
              BotToast.showCustomLoading(
                  clickClose: true,
                  allowClick: true,
                  backButtonBehavior: BackButtonBehavior.none,
                  ignoreContentClick: false,
                  backgroundColor: Color(0x42000000),
                  align: Alignment.center,
                  onClose: () {
                    BlocProvider.of<UserAuthBloc>(context)
                        .add(SignUpSuccessfulEvent(currentUser: state.user));
                  },
                  toastBuilder: (cancelFunc) {
                    return Card(
                      shape: RoundedRectangleBorder(),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Text('Signup Successful!.'),
                      ),
                    );
                  });
            }
            if (state is SignUpLoadingState) {
              BotToast.showCustomLoading(
                  clickClose: false,
                  allowClick: true,
                  backButtonBehavior: BackButtonBehavior.none,
                  ignoreContentClick: false,
                  backgroundColor: Color(0x42000000),
                  align: Alignment.center,
                  toastBuilder: (cancelFunc) {
                    return Card(
                      shape: RoundedRectangleBorder(),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: CircularProgressIndicator(
                          backgroundColor: Theme.of(context).primaryColor,
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    );
                  });
            }
            if (state is SignUpFailedState) {
              BotToast.closeAllLoading();
              BotToast.showCustomLoading(
                  clickClose: true,
                  allowClick: true,
                  backButtonBehavior: BackButtonBehavior.none,
                  ignoreContentClick: false,
                  backgroundColor: Color(0x42000000),
                  align: Alignment.center,
                  toastBuilder: (cancelFunc) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Text(state.errorMessage),
                      ),
                    );
                  });
            }
          },
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  BlocBuilder<SignUpBloc, SignUpState>(
                    bloc: signUpBloc,
                    builder: (context, state) {
                      if (state is SignUpLoadingState) {}
                      return SizedBox.shrink();
                    },
                  ),
                  Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image:
                          AssetImage('assets/images/signup_illustration.png'),
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
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Form(
                                  key: _signUpFormKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10, bottom: 10),
                                        child: TextFormField(
                                            focusNode: _firstNameFocus,
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.text,
                                            style: TextStyle(
                                              color: Color(0xFF3D4C63),
                                              fontSize: 16,
                                            ),
                                            cursorColor: Color(0xFF3D4C63),
                                            decoration: InputDecoration(
                                              labelText: 'First Name',
                                              labelStyle: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    width: 1.0),
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFF3D4C63),
                                                    width: 0.3),
                                              ),
                                            ),
                                            validator: (input) =>
                                                input.trim().length < 1
                                                    ? 'Please input valid name'
                                                    : null,
                                            onSaved: (input) =>
                                                _firstName = input,
                                            onFieldSubmitted: (value) {
                                              _fieldFocusChange(
                                                  context,
                                                  _firstNameFocus,
                                                  _lastNameFocus);
                                            }),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10, bottom: 10),
                                        child: TextFormField(
                                          focusNode: _lastNameFocus,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.text,
                                          onFieldSubmitted: (value) {
                                            _fieldFocusChange(context,
                                                _lastNameFocus, _emailFocus);
                                          },
                                          style: TextStyle(
                                            color: Color(0xFF3D4C63),
                                            fontSize: 16,
                                          ),
                                          cursorColor: Color(0xFF3D4C63),
                                          decoration: InputDecoration(
                                            labelText: 'Last Name',
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.w400),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF3D4C63),
                                                  width: 0.3),
                                            ),
                                          ),
                                          validator: (input) =>
                                              input.trim().length < 1
                                                  ? 'Please input valid name'
                                                  : null,
                                          onSaved: (input) => _lastName = input,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10, bottom: 10),
                                        child: TextFormField(
                                          focusNode: _emailFocus,
                                          textInputAction: TextInputAction.next,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onFieldSubmitted: (value) {
                                            _fieldFocusChange(context,
                                                _emailFocus, _passwordFocus);
                                          },
                                          style: TextStyle(
                                            color: Color(0xFF3D4C63),
                                            fontSize: 16,
                                          ),
                                          cursorColor: Color(0xFF3D4C63),
                                          decoration: InputDecoration(
                                            labelText: 'Email Address',
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.w400),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF3D4C63),
                                                  width: 0.3),
                                            ),
                                          ),
                                          validator: (input) =>
                                              !input.contains('@')
                                                  ? 'please enter a valid email'
                                                  : null,
                                          onSaved: (input) => _email = input,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10, bottom: 10),
                                        child: TextFormField(
                                          focusNode: _passwordFocus,
                                          textInputAction: TextInputAction.done,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          style: TextStyle(
                                            color: Color(0xFF3D4C63),
                                            fontSize: 16,
                                          ),
                                          cursorColor: Color(0xFF3D4C63),
                                          decoration: InputDecoration(
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _obscureText = !_obscureText;
                                                });
                                              },
                                              child: Icon(
                                                _obscureText
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.grey,
                                                size: 20,
                                              ),
                                            ),
                                            labelText: 'Password',
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.w400),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF3D4C63),
                                                  width: 0.3),
                                            ),
                                          ),
                                          validator: (input) => input.length < 6
                                              ? 'password must be more than 6 characters'
                                              : null,
                                          onSaved: (input) => _password = input,
                                          obscureText: _obscureText,
                                        ),
                                      ),
                                      SizedBox(height: 10),
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
                                                  child:
                                                      CircularProgressIndicator(
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .primaryColor,
                                                    valueColor:
                                                        new AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.white),
                                                  ),
                                                )
                                              : Text(
                                                  'Signup',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Already have an account?',
                                            style: TextStyle(
                                              color: Color(0xFF3D4C63),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Login',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _submit() async {
    if (_signUpFormKey.currentState.validate()) {
      _signUpFormKey.currentState.save();
      FocusScope.of(context).unfocus();
      signUpBloc.add(SignUpButtonPressed(
          firstName: _firstName,
          lastName: _lastName,
          email: _email,
          password: _password));
    }
  }
}
