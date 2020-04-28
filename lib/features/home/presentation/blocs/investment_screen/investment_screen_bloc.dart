import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:vestinsight/core/services/database_service.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import 'package:vestinsight/injection_container.dart';
import './bloc.dart';

class InvestmentScreenBloc
    extends Bloc<InvestmentScreenEvent, InvestmentScreenState> {
  DataBaseService _dataBaseService = sl<DataBaseService>();
  @override
  InvestmentScreenState get initialState => InitialInvestmentScreenState();

  @override
  Stream<InvestmentScreenState> mapEventToState(
    InvestmentScreenEvent event,
  ) async* {
    if(event is InvestmentScreenLoadedEvent){
      try{
        yield InvestmentScreenLoadingState();
        Investment investment = await _dataBaseService.getInvestment(investmentId: event.investmentId);
        User investor = await _dataBaseService.getUser(userId: investment.investorId);
        Broker broker = await _dataBaseService.getBroker(brokerId: investment.brokerId);
        yield InvestmentScreenSuccessState(broker: broker,investor: investor, investment: investment);
      } catch (e){
        yield InvestmentScreenFailureState(e.toString());
      }
    }
  }
}
