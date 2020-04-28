import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();
}

class UserProfilesPageLoadedEvent extends UserProfileEvent {
  final String userId;
  UserProfilesPageLoadedEvent({@required this.userId});
  @override
  List<Object> get props => [userId];
}
