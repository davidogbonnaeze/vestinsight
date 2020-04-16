import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class UserAuthState {
  const UserAuthState();
}

class InitialUserAuthState extends UserAuthState {}

class AuthenticatedState extends UserAuthState {
  final FirebaseUser user;
  AuthenticatedState({@required this.user});
}

class UnauthenticatedState extends UserAuthState {}

class FirstTimeAuthState extends UserAuthState {}
