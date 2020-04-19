import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => null;
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => null;
}

class LoginSuccessState extends LoginState {
  final FirebaseUser user;

  LoginSuccessState({this.user});

  @override
  List<Object> get props => [user];
}

class LoginFailState extends LoginState {
  final String message;

  LoginFailState({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
