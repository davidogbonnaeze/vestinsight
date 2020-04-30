import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WatchInvestmentState extends Equatable {
  const WatchInvestmentState();
}

class InitialWatchInvestmentState extends WatchInvestmentState {
  @override
  List<Object> get props => [];
}

class WatchInvestmentLoadingState extends WatchInvestmentState {
  @override
  List<Object> get props => [];
}

class WatchInvestmentSuccessState extends WatchInvestmentState {
  @override
  List<Object> get props => [];
}

class WatchInvestmentFailureState extends WatchInvestmentState {
  final String message;
  WatchInvestmentFailureState(this.message);
  @override
  List<Object> get props => [message];
}

class UnWatchInvestmentLoadingState extends WatchInvestmentState {
  @override
  List<Object> get props => [];
}

class UnWatchInvestmentSuccessState extends WatchInvestmentState {
  @override
  List<Object> get props => [];
}

class UnWatchInvestmentFailureState extends WatchInvestmentState {
  final String message;
  UnWatchInvestmentFailureState(this.message);
  @override
  List<Object> get props => [message];
}

class IsWatchingInvestmentState extends WatchInvestmentState {
  @override
  List<Object> get props => [];
}

class IsNotWatchingInvestmentState extends WatchInvestmentState {
  @override
  List<Object> get props => [];
}
