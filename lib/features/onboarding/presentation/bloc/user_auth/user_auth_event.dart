import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class UserAuthEvent {
  const UserAuthEvent();
}

class AppStartedEvent extends UserAuthEvent {}

class LogOutEvent extends UserAuthEvent {}

class SignUpSuccessfulEvent extends UserAuthEvent{
  FirebaseUser currentUser;

  SignUpSuccessfulEvent({@required this.currentUser});

}

class LoginSuccessfulEvent extends UserAuthEvent{
  FirebaseUser currentUser;

  LoginSuccessfulEvent({@required this.currentUser});

}
