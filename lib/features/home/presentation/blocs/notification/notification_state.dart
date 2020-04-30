import 'package:equatable/equatable.dart';
import 'package:vestinsight/features/home/domain/entities/notification.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
}

class InitialNotificationState extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotificationLoadingState extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotificationSuccessState extends NotificationState {
  final List<AppNotification> notifications;
  NotificationSuccessState(this.notifications);
  @override
  List<Object> get props => [notifications];
}

class NotificationFailureState extends NotificationState {
  final String message;

  NotificationFailureState(this.message);
  @override
  List<Object> get props => [message];
}
