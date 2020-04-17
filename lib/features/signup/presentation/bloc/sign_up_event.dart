import 'package:meta/meta.dart';

@immutable
abstract class SignUpEvent {}

class SignUpButtonPressed extends SignUpEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  SignUpButtonPressed({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.password,
  });
}
