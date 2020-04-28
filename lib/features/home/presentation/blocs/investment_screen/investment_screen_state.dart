import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';

abstract class InvestmentScreenState extends Equatable {
  const InvestmentScreenState();
}

class InitialInvestmentScreenState extends InvestmentScreenState {
  @override
  List<Object> get props => [];
}

class InvestmentScreenLoadingState extends InvestmentScreenState {
  @override
  List<Object> get props => [];
}

class InvestmentScreenFailureState extends InvestmentScreenState {
  final String message;
  InvestmentScreenFailureState(this.message);
  @override
  List<Object> get props => [message];
}

class InvestmentScreenSuccessState extends InvestmentScreenState {
  final Investment investment;
  final User investor;
  final Broker broker;

  InvestmentScreenSuccessState({
    @required this.investment,
    @required this.investor,
    @required this.broker,
  });
  @override
  List<Object> get props => [investment, investor, broker];
}
