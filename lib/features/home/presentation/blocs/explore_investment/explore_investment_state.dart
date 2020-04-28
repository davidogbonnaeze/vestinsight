import 'package:equatable/equatable.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';

abstract class ExploreInvestmentState extends Equatable {
  const ExploreInvestmentState();
}

class InitialExploreInvestmentState extends ExploreInvestmentState {
  @override
  List<Object> get props => [];
}

class ExploreInvestmentLoadingState extends ExploreInvestmentState {
  @override
  List<Object> get props => [];
}

class ExploreInvestmentSuccessState extends ExploreInvestmentState {
  final List<Investment> investments;
  const ExploreInvestmentSuccessState({this.investments});
  @override
  List<Object> get props => [investments];
}

class ExploreInvestmentFailureState extends ExploreInvestmentState {
  final String message;
  ExploreInvestmentFailureState(this.message);
  @override
  List<Object> get props => [message];
}
