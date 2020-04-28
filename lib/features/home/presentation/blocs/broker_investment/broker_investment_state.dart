import 'package:equatable/equatable.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';

abstract class BrokerInvestmentState extends Equatable {
  const BrokerInvestmentState();
}

class InitialBrokerInvestmentState extends BrokerInvestmentState {
  @override
  List<Object> get props => [];
}

class BrokerInvestmentLoadingState extends BrokerInvestmentState {
  @override
  List<Object> get props => [];
}

class BrokerInvestmentSuccessState extends BrokerInvestmentState {
  final List<Investment> investments;
  final Broker broker;
  const BrokerInvestmentSuccessState({this.investments, this.broker});
  @override
  List<Object> get props => [investments, broker];
}

class BrokerInvestmentFailureState extends BrokerInvestmentState {
  final String message;
  BrokerInvestmentFailureState(this.message);
  @override
  List<Object> get props => [message];
}
