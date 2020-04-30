import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:vestinsight/core/services/database_service.dart';
import 'package:vestinsight/features/home/domain/entities/notification.dart';
import 'package:vestinsight/injection_container.dart';
import './bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  DataBaseService _dataBaseService = sl<DataBaseService>();
  @override
  NotificationState get initialState => InitialNotificationState();

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    if (event is FetchNotificationsEvent) {
      try {
        yield NotificationLoadingState();
        List<AppNotification> notifications =
            await _dataBaseService.getNotifications(event.userId);
        yield NotificationSuccessState(notifications);
      } catch (error) {
        yield NotificationFailureState(error.toString());
      }
    }
  }
}
