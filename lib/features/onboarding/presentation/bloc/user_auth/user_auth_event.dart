import 'package:equatable/equatable.dart';

abstract class UserAuthEvent {
  const UserAuthEvent();
}

class AppStartedEvent extends UserAuthEvent {}

class LogOutEvent extends UserAuthEvent {}
