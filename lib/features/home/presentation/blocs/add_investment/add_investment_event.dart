import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

abstract class AddInvestmentEvent extends Equatable {
  const AddInvestmentEvent();
}

class AddInvestmentButtonPressedEvent extends AddInvestmentEvent {
  final String brokerId;
  final String investorId;
  final Timestamp timestamp;
  final String investmentDescription;
  final String investmentAmount;
  final String investmentDuration;
  final String investmentDate;
  final String percentageROI;
  final File proofOfInvestment;

  const AddInvestmentButtonPressedEvent({
    @required this.brokerId,
    @required this.investmentDescription,
    @required this.investmentAmount,
    @required this.investmentDuration,
    @required this.investmentDate,
    @required this.percentageROI,
    @required this.proofOfInvestment,
    @required this.investorId,
    @required this.timestamp,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        brokerId,
        investmentDuration,
        investmentAmount,
        investmentDate,
        investmentDescription,
        percentageROI,
        proofOfInvestment,
        investorId,
        timestamp,
      ];
}
