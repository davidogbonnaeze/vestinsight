import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';

abstract class UserAuthState extends Equatable {
  const UserAuthState();
}

class InitialUserAuthState extends UserAuthState {
  @override
  List<Object> get props => null;
}

class AuthenticatedState extends UserAuthState {
  final User user;
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
