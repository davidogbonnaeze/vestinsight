import 'package:flutter/material.dart';
import 'package:vestinsight/routes.dart';

class InvestmentCard extends StatelessWidget {
  final String investorName;
  final String investorImageURL;
  final String brokerImageURL;
  final String investmentDescription;
  final String investmentAmount;
  final String investmentDuration;
  final String percentageROI;
  InvestmentCard(
      {this.investorName,
      this.investorImageURL,
      this.brokerImageURL,
      this.investmentDescription,
      this.investmentAmount,
      this.investmentDuration,
      this.percentageROI});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Routes.sailor.navigate('/investment_screen'),
      child: Container(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(investorImageURL),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 15),
                        Text(
                          investorName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(brokerImageURL),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  investmentDescription,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black45,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        investmentAmount,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Amount',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        percentageROI,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Returns',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        investmentDuration,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Duration',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
