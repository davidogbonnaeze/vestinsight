import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:vestinsight/core/services/database_service.dart';
import 'package:vestinsight/features/home/data/local/models/investment_model.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import '../../../../../injection_container.dart';
import './bloc.dart';

class InvestmentCardBloc
    extends Bloc<InvestmentCardEvent, InvestmentCardState> {
  DataBaseService _dataBaseService = sl<DataBaseService>();
  @override
  InvestmentCardState get initialState => InitialInvestmentCardState();

  @override
  Stream<InvestmentCardState> mapEventToState(
    InvestmentCardEvent event,
  ) async* {
    if (event is InvestmentCardLoaded) {
      try {
        yield InvestmentCardLoadingState();
        Broker broker =
            await _dataBaseService.getBroker(brokerId: event.brokerId);
        User investor =
            await _dataBaseService.getUser(userId: event.investorId);
        Investment investment = await _dataBaseService.getInvestment(
            investmentId: event.investmentId);
        yield InvestmentCardSuccessState(
            broker: broker, investor: investor, investment: investment);
      } catch (e) {
        yield InvestmentCardFailureState();
      }
    }
  }
}
