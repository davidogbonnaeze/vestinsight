import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:vestinsight/core/services/database_service.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/injection_container.dart';
import './bloc.dart';

class ExploreInvestmentBloc
    extends Bloc<ExploreInvestmentEvent, ExploreInvestmentState> {
  DataBaseService _dataBaseService = sl<DataBaseService>();
  @override
  ExploreInvestmentState get initialState => InitialExploreInvestmentState();

  @override
  Stream<ExploreInvestmentState> mapEventToState(
    ExploreInvestmentEvent event,
  ) async* {
    if (event is ExploreInvestmentsPageLoadedEvent) {
      try {
        yield ExploreInvestmentLoadingState();
        List<Investment> investments =
            await _dataBaseService.getAllInvestments();
        yield ExploreInvestmentSuccessState(investments: investments);
      } catch (e) {
        yield ExploreInvestmentFailureState(e.toString());
      }
    }
  }
}
