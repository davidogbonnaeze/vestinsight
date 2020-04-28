import 'package:equatable/equatable.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import 'package:meta/meta.dart';

abstract class InvestmentCardState extends Equatable {
  const InvestmentCardState();
}

class InitialInvestmentCardState extends InvestmentCardState {
  @override
  List<Object> get props => [];
}

class InvestmentCardLoadingState extends InvestmentCardState {
  @override
  List<Object> get props => [];
}

class InvestmentCardSuccessState extends InvestmentCardState {
  final Broker broker;
  final User investor;
  final Investment investment;
  InvestmentCardSuccessState(
      {@required this.broker,
      @required this.investor,
      @required this.investment});
  @override
  List<Object> get props => [broker, investor, investment];
}

class InvestmentCardFailureState extends InvestmentCardState {
  @override
  List<Object> get props => [];
}
