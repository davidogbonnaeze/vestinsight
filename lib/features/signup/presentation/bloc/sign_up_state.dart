import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SignUpState extends Equatable {}

class SignUpInitialState extends SignUpState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SignUpLoadingState extends SignUpState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SignUpSuccessState extends SignUpState {
  final FirebaseUser user;

  SignUpSuccessState({this.user});

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class SignUpFailedState extends SignUpState {
  final String errorMessage;

  SignUpFailedState({this.errorMessage});

  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];
}
