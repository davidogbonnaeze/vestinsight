import 'package:equatable/equatable.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();
}

class InitialUserProfileState extends UserProfileState {
  @override
  List<Object> get props => [];
}

class UserProfileLoadingState extends UserProfileState {
  @override
  List<Object> get props => [];
}

class UserProfileSuccessState extends UserProfileState {
  final List<Investment> watchingInvestments;
  final List<Investment> userInvestments;
  const UserProfileSuccessState({this.watchingInvestments, this.userInvestments});
  @override
  List<Object> get props => [watchingInvestments,userInvestments];
}

class UserProfileFailureState extends UserProfileState {
  final String message;
  UserProfileFailureState(this.message);
  @override
  List<Object> get props => [message];
}
