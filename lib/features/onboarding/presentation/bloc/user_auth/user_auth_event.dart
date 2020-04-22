import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';

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

class UserProfileChanged extends UserAuthEvent {
  final User user;

  UserProfileChanged({@required this.user});

  @override
  List<Object> get props => [user];
}
