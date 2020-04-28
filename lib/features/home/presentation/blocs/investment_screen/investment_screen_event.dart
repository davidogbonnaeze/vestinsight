import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class InvestmentScreenEvent extends Equatable {
  const InvestmentScreenEvent();
}

class InvestmentScreenLoadedEvent extends InvestmentScreenEvent {
  final String investmentId;

  InvestmentScreenLoadedEvent({@required this.investmentId});

  @override
  List<Object> get props => [investmentId];
}
