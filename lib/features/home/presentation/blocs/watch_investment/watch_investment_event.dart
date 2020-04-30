import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';

abstract class WatchInvestmentEvent extends Equatable {
  const WatchInvestmentEvent();
}

class OnWatchInvestmentEvent extends WatchInvestmentEvent {
  final Investment investment;
  final User currentUser;

  OnWatchInvestmentEvent(
      {@required this.investment, @required this.currentUser});
  @override
  // TODO: implement props
  List<Object> get props => [investment, currentUser];
}

class OnUnWatchInvestmentEvent extends WatchInvestmentEvent {
  final Investment investment;
  final User currentUser;

  OnUnWatchInvestmentEvent(
      {@required this.investment, @required this.currentUser});
  @override
  // TODO: implement props
  List<Object> get props => [investment, currentUser];
}

class IsWatchingInvestmentEvent extends WatchInvestmentEvent {
  final Investment investment;
  final User currentUser;

  IsWatchingInvestmentEvent(
      {@required this.investment, @required this.currentUser});
  @override
  // TODO: implement props
  List<Object> get props => [investment, currentUser];
}
