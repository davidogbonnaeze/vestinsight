import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:vestinsight/core/services/database_service.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import '../../../../../injection_container.dart';
import './bloc.dart';

class BrokerInvestmentBloc
    extends Bloc<BrokerInvestmentEvent, BrokerInvestmentState> {
  DataBaseService _dataBaseService = sl<DataBaseService>();
  @override
  BrokerInvestmentState get initialState => InitialBrokerInvestmentState();

  @override
  Stream<BrokerInvestmentState> mapEventToState(
    BrokerInvestmentEvent event,
  ) async* {
    if (event is BrokerInvestmentsPageLoadedEvent) {
      try {
        yield BrokerInvestmentLoadingState();
        Broker broker =
            await _dataBaseService.getBroker(brokerId: event.brokerId);
        List<Investment> investments =
            await _dataBaseService.getBrokerInvestments(event.brokerId);

        yield BrokerInvestmentSuccessState(
            investments: investments, broker: broker);
      } catch (e) {
        yield BrokerInvestmentFailureState(e.toString());
      }
    }
  }
}
