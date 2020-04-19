import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class UserAuthEvent extends Equatable {
  const UserAuthEvent();
}

class AppStartedEvent extends UserAuthEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LogOutEvent extends UserAuthEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SignUpSuccessfulEvent extends UserAuthEvent {
  final FirebaseUser currentUser;

  SignUpSuccessfulEvent({@required this.currentUser});

  @override
  // TODO: implement props
  List<Object> get props => [currentUser];
}

class LoginSuccessfulEvent extends UserAuthEvent {
  final FirebaseUser currentUser;

  LoginSuccessfulEvent({@required this.currentUser});

  @override
  List<Object> get props => [currentUser];
}
