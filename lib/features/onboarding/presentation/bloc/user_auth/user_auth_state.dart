import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class UserAuthState extends Equatable {
  const UserAuthState();
}

class InitialUserAuthState extends UserAuthState {
  @override
  List<Object> get props => null;
}

class AuthenticatedState extends UserAuthState {
  final FirebaseUser user;
  AuthenticatedState({@required this.user});

  @override
  List<Object> get props => [user];
}

class UnauthenticatedState extends UserAuthState {
  @override
  List<Object> get props => null;
}

class FirstTimeAuthState extends UserAuthState {
  @override
  List<Object> get props => null;
}
