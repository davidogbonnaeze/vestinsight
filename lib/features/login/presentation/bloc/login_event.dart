import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String email, password;

  LoginButtonPressed({@required this.email, @required this.password});
}
