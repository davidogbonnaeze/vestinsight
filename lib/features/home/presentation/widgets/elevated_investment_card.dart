import 'package:flutter/material.dart';

import 'investment_card.dart';

class ElevatedInvestmentCard extends StatelessWidget {
  final String investorId;
  final String brokerId;
  final String investmentId;
  final String investmentDescription;
  final String investmentAmount;
  final String investmentDuration;
  final String percentageROI;
  ElevatedInvestmentCard(
      {this.investorId,
      this.brokerId,
        this.investmentId,
      this.investmentDescription,
      this.investmentAmount,
      this.investmentDuration,
      this.percentageROI});
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: _screenWidth * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Card(
          elevation: 2,
          child: InvestmentCard(
            investmentId: this.investmentId,
            brokerId: this.brokerId,
            investmentAmount: this.investmentAmount,
            investmentDescription: this.investmentDescription,
            investmentDuration: this.investmentDuration,
            investorId: this.investorId,
            percentageROI: this.percentageROI,
          ),
        ),
      ),
    );
  }
}
