import 'package:equatable/equatable.dart';

class Investment extends Equatable {
  final String id;
  final String amount;
  final String brokerId;
  final String investorId;
  final String investorName;
  final String description;
  final String duration;
  final DateTime investmentDate;
  final String percentageROI;
  final String proofOfInvestmentURL;
  final String investmentStatus;
  final List<String> watchers;

  Investment({
    this.id,
    this.amount,
    this.brokerId,
    this.investorId,
    this.investorName,
    this.description,
    this.duration,
    this.investmentDate,
    this.percentageROI,
    this.proofOfInvestmentURL,
    this.investmentStatus,
    this.watchers,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        amount,
        brokerId,
        investorId,
        investorName,
        description,
        duration,
        investmentDate,
        percentageROI,
        proofOfInvestmentURL,
        investmentStatus,
        watchers,
      ];
}
