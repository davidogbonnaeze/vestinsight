import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {
  const LoginState();
}

class InitialLoginState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final FirebaseUser user;

  LoginSuccessState({this.user});
}

class LoginFailState extends LoginState {
  final String message;

  LoginFailState({this.message});
}
