import 'package:equatable/equatable.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class FetchNotificationsEvent extends NotificationEvent {
  final String userId;

  FetchNotificationsEvent(this.userId);
  @override
  List<Object> get props => [userId];
}
