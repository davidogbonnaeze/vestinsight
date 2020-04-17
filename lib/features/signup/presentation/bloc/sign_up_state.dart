import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final FirebaseUser user;

  SignUpSuccessState({this.user});
}

class SignUpFailedState extends SignUpState {
  final String errorMessage;

  SignUpFailedState({this.errorMessage});
}
