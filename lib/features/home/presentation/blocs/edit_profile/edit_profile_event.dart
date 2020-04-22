import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();
}

class EditProfileButtonPressed extends EditProfileEvent {
  final File profilePicture;
  final User user;
  final String newFirstName;
  final String newLastName;

  const EditProfileButtonPressed({
    @required this.profilePicture,
    @required this.user,
    @required this.newFirstName,
    @required this.newLastName,
  });

  @override
  List<Object> get props => [profilePicture, user, newFirstName, newLastName];
}
