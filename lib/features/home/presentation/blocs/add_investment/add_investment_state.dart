import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AddInvestmentState extends Equatable {
  const AddInvestmentState();
}

class InitialAddInvestmentState extends AddInvestmentState {
  @override
  List<Object> get props => [];
}

class AddInvestmentLoadingState extends AddInvestmentState {
  @override
  List<Object> get props => [];
}

class AddInvestmentSuccessState extends AddInvestmentState {
  @override
  List<Object> get props => [];
}

class AddInvestmentFailureState extends AddInvestmentState {
  final String message;
  const AddInvestmentFailureState({@required this.message});

  @override
  List<Object> get props => [message];
}
