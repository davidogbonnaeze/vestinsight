import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:vestinsight/core/services/database_service.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import '../../../../../injection_container.dart';
import './bloc.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  DataBaseService _dataBaseService = sl<DataBaseService>();
  @override
  UserProfileState get initialState => InitialUserProfileState();

  @override
  Stream<UserProfileState> mapEventToState(
    UserProfileEvent event,
  ) async* {
    if (event is UserProfilesPageLoadedEvent) {
      try {
        yield UserProfileLoadingState();
        List<Investment> watchingInvestments =
            await _dataBaseService.getWatchingInvestments(event.userId);
        List<Investment> userInvestments =
            await _dataBaseService.getUserInvestments(event.userId);
        yield UserProfileSuccessState(
            userInvestments: userInvestments,
            watchingInvestments: watchingInvestments);
      } catch (e) {
        yield UserProfileFailureState(e.toString());
      }
    }
  }
}
