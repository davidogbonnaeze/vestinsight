import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vestinsight/features/home/data/local/models/notification_model.dart';
import 'package:vestinsight/features/home/domain/entities/notification.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import 'package:vestinsight/features/home/presentation/blocs/notification/bloc.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/user_auth_bloc.dart';
import 'package:vestinsight/injection_container.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  NotificationBloc _notificationBloc;
  User currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = BlocProvider.of<UserAuthBloc>(context).state.props[0];
    _notificationBloc = sl<NotificationBloc>();
    if (mounted) {
      _notificationBloc.add(FetchNotificationsEvent(currentUser.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: SizedBox.shrink(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            iconSize: 20,
            color: Colors.white,
            onPressed: () {},
          )
        ],
        title: Center(
          child: Text(
            'Notifications',
            style: TextStyle(color: Colors.black45, fontSize: 20),
          ),
        ),
      ),
      body: BlocProvider<NotificationBloc>(
        create: (_) => _notificationBloc,
        child: BlocBuilder<NotificationBloc, NotificationState>(
          bloc: _notificationBloc,
          builder: (context, state) {
            if (state is NotificationLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is NotificationSuccessState) {
              List<AppNotification> notifications = state.notifications;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: notifications.length,
                    itemBuilder: (BuildContext context, int index) {
                      AppNotification notification = notifications[index];
                      DateTime notificationDate =
                          notification.timestamp.toDate();
                      var formatter = new DateFormat('MMMd');
                      String formattedDate = formatter.format(notificationDate);

                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: notification
                                    .notifierProfileImageUrl.isEmpty
                                ? AssetImage('assets/images/placeholder.png')
                                : CachedNetworkImageProvider(
                                    notification.notifierProfileImageUrl),
                          ),
                          title: Text(
                            notification.notifierName,
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            '${notification.action} your investment',
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Text(
                            formattedDate,
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    }),
              );
            }
            if (state is NotificationFailureState) {
              return Center(
                child: Text('An Error Occured'),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
