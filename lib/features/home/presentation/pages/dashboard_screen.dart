import 'package:flutter/material.dart';
import 'package:vestinsight/features/home/data/local/models/brokers_model.dart';
import 'package:vestinsight/features/home/data/local/models/investment_model.dart';
import 'package:vestinsight/features/home/presentation/widgets/investment_card.dart';

import '../../../../routes.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 5, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          color: Colors.black45,
                          icon: Icon(Icons.settings),
                          onPressed: () {
                            Routes.sailor.navigate('/settings_screen');
                          },
                          iconSize: MediaQuery.of(context).size.height > 600
                              ? 20
                              : 25,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20,
                        MediaQuery.of(context).size.height < 600 ? 10 : 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Hi, David',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height < 600
                                ? 30
                                : 40,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Total Investments',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '\$200',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFededed),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 210,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .1,
                              top: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Investment Brokers',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          height: 150,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: brokers.length,
                              itemBuilder: (BuildContext context, int index) {
                                BrokerModel broker = brokers[index];
                                return InkWell(
                                  onTap: () => Routes.sailor
                                      .navigate('/explore_investment_screen'),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                image: DecorationImage(
                                                  image:
                                                      AssetImage(broker.imgUrl),
                                                ),
                                              ),
                                            ),
                                            Text(broker.name),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Container(
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .1),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Latest Investments',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            padding: EdgeInsets.only(left: 10),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemCount: investments.length,
                                itemBuilder: (BuildContext context, int index) {
                                  InvestmentModel investment =
                                      investments[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 200,
                                      width: 290,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: InvestmentCard(
                                        brokerImageURL: investment.brokerId,
                                        investorName: investment.investorName,
                                        investmentAmount: investment.amount,
                                        investmentDescription:
                                            investment.description,
                                        investmentDuration: investment.duration,
                                        investorImageURL: investment.investorId,
                                        percentageROI: investment.percentageROI,
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
