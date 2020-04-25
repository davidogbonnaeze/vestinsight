import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Investment extends Equatable {
  final String id;
  final String amount;
  final String brokerId;
  final String investorId;
  final String description;
  final String duration;
  final String investmentDate;
  final String percentageROI;
  final String proofOfInvestmentURL;
  final String investmentStatus;
  final Timestamp timestamp;

  Investment({
    this.id,
    @required this.amount,
    @required this.brokerId,
    @required this.investorId,
    @required this.description,
    @required this.duration,
    @required this.investmentDate,
    @required this.percentageROI,
    @required this.proofOfInvestmentURL,
    @required this.investmentStatus,
    @required this.timestamp,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        amount,
        brokerId,
        investorId,
        description,
        duration,
        investmentDate,
        percentageROI,
        proofOfInvestmentURL,
        investmentStatus,
        timestamp
      ];

  factory Investment.fromDoc(DocumentSnapshot doc) {
    return Investment(
      id: doc.documentID,
      amount: doc['amount'],
      brokerId: doc['brokerId'],
      investorId: doc['investorId'],
      description: doc['description'],
      duration: doc['duration'],
      investmentDate: doc['investmentDate'],
      percentageROI: doc['percentageROI'],
      proofOfInvestmentURL: doc['proofOfInvestmentURL'],
      investmentStatus: doc['investmentStatus'],
      timestamp: doc['timestamp'],
    );
  }
}
