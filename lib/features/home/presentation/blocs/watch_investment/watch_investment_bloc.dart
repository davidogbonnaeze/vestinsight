import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:vestinsight/core/services/database_service.dart';
import 'package:vestinsight/injection_container.dart';
import './bloc.dart';

class WatchInvestmentBloc
    extends Bloc<WatchInvestmentEvent, WatchInvestmentState> {
  DataBaseService _dataBaseService = sl<DataBaseService>();

  @override
  WatchInvestmentState get initialState => InitialWatchInvestmentState();

  @override
  Stream<WatchInvestmentState> mapEventToState(
    WatchInvestmentEvent event,
  ) async* {
    if (event is OnWatchInvestmentEvent) {
      try {
        yield WatchInvestmentLoadingState();
        _dataBaseService.watchInvestment(event.investment, event.currentUser);
        yield WatchInvestmentSuccessState();
      } catch (e) {
        yield WatchInvestmentFailureState(e.toString());
      }
    }
    if (event is OnUnWatchInvestmentEvent) {
      try {
        yield UnWatchInvestmentLoadingState();
        _dataBaseService.unWatchInvestment(event.investment, event.currentUser);
        yield UnWatchInvestmentSuccessState();
      } catch (e) {
        yield UnWatchInvestmentFailureState(e.toString());
      }
    }
    if (event is IsWatchingInvestmentEvent) {
      bool isWatchingInvestment = await _dataBaseService.isWatchingInvestment(
          event.investment, event.currentUser);
      if (isWatchingInvestment) {
        print(isWatchingInvestment);
        yield IsWatchingInvestmentState();
      } else {
        yield IsNotWatchingInvestmentState();
      }
    }
  }
}
