import 'package:flutter/material.dart';

import 'investment_card.dart';

class ElevatedInvestmentCard extends StatelessWidget {
  final String investorName;
  final String investorImageURL;
  final String brokerImageURL;
  final String investmentDescription;
  final String investmentAmount;
  final String investmentDuration;
  final String percentageROI;
  ElevatedInvestmentCard(
      {this.investorName,
      this.investorImageURL,
      this.brokerImageURL,
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
        height: 200,
        width: _screenWidth * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Card(
          elevation: 4,
          child: InvestmentCard(
            brokerImageURL: this.brokerImageURL,
            investorName: this.investorName,
            investmentAmount: this.investmentAmount,
            investmentDescription: this.investmentDescription,
            investmentDuration: this.investmentDuration,
            investorImageURL: this.investorImageURL,
            percentageROI: this.percentageROI,
          ),
        ),
      ),
    );
  }
}
