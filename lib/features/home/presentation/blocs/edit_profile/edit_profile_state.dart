import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();
}

class InitialEditProfileState extends EditProfileState {
  @override
  List<Object> get props => [];
}

class EditProfileLoadingState extends EditProfileState {
  @override
  List<Object> get props => [];
}

class EditProfileSuccessState extends EditProfileState {
  final User user;

  const EditProfileSuccessState({@required this.user});

  @override
  List<Object> get props => [user];
}

class EditProfileFailureState extends EditProfileState {
  final String message;

  const EditProfileFailureState({@required this.message});

  @override
  List<Object> get props => [message];
}
