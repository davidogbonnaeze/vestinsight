import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  final String id;
  final String notifierId;
  final String investmentId;
  final String investorName;
  final DateTime timestamp;

  Notification(
      {this.id,
      this.notifierId,
      this.investmentId,
      this.investorName,
      this.timestamp});

  @override
  // TODO: implement props
  List<Object> get props =>
      [id, notifierId, investmentId, investorName, timestamp];
}
