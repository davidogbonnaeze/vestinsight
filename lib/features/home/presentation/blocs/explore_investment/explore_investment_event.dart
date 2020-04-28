import 'package:equatable/equatable.dart';

abstract class ExploreInvestmentEvent extends Equatable {
  const ExploreInvestmentEvent();
}

class PullRefreshEvent extends ExploreInvestmentEvent {
  @override
  List<Object> get props => [];
}

class ExploreInvestmentsPageLoadedEvent extends ExploreInvestmentEvent {
  @override
  List<Object> get props => [];
}
