import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String email, password;

  LoginButtonPressed({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
