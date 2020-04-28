import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class BrokerInvestmentEvent extends Equatable {
  const BrokerInvestmentEvent();
}

class BrokerInvestmentsPageLoadedEvent extends BrokerInvestmentEvent {
  final String brokerId;
  BrokerInvestmentsPageLoadedEvent({@required this.brokerId});
  @override
  List<Object> get props => [brokerId];
}
