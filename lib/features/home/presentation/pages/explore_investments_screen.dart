import 'package:flutter/material.dart';
import 'package:vestinsight/features/home/data/local/models/investment_model.dart';
import 'package:vestinsight/features/home/presentation/pages/dashboard_screen.dart';
import 'package:vestinsight/features/home/presentation/widgets/elevated_investment_card.dart';
import 'package:vestinsight/features/home/presentation/widgets/investment_card.dart';

class ExploreInvestmentsScreen extends StatefulWidget {
  @override
  _ExploreInvestmentsScreenState createState() =>
      _ExploreInvestmentsScreenState();
}

class _ExploreInvestmentsScreenState extends State<ExploreInvestmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: SizedBox.shrink(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            iconSize: 20,
            color: Colors.black45,
            onPressed: () {},
          )
        ],
        title: Center(
          child: Text(
            'Explore Investments',
            style: TextStyle(color: Colors.black45, fontSize: 20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: investments.length,
            itemBuilder: (BuildContext context, int index) {
              InvestmentModel investment = investments[index];
              return ElevatedInvestmentCard(
                brokerImageURL: investment.brokerId,
                investorName: investment.investorName,
                investmentAmount: investment.amount,
                investmentDescription: investment.description,
                investmentDuration: investment.duration,
                investorImageURL: investment.investorId,
                percentageROI: investment.percentageROI,
              );
            }),
      ),
    );
  }
}
