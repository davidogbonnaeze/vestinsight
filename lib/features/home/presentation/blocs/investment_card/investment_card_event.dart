import 'package:equatable/equatable.dart';

abstract class InvestmentCardEvent extends Equatable {
  const InvestmentCardEvent();
}

class InvestmentCardLoaded extends InvestmentCardEvent {
  final String investorId;
  final String brokerId;
  final String investmentId;
  InvestmentCardLoaded({this.investorId, this.brokerId, this.investmentId});
  @override
  List<Object> get props => [investorId, brokerId, investmentId];
}
