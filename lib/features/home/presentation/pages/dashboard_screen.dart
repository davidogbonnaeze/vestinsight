import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sailor/sailor.dart';
import 'package:vestinsight/core/services/database_service.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import 'package:vestinsight/features/home/presentation/widgets/investment_card.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/bloc.dart';
import 'package:vestinsight/injection_container.dart';

import '../../../../routes.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<Broker> _brokers;
  List<Investment> _latestInvestment;
  DataBaseService dataBaseService;
  int numberOfInvestments;
  @override
  void initState() {
    getBrokers();
    getLatestInvestments();
    super.initState();
  }

  getBrokers() async {
    List<Broker> brokers = sl<List<Broker>>();
    if (mounted) {
      _brokers = brokers;
      dataBaseService = sl<DataBaseService>();
      User currentUser = BlocProvider.of<UserAuthBloc>(context).state.props[0];
      numberOfInvestments =
          await dataBaseService.getNumberOfUserInvestments(currentUser.id);
      setState(() {});
    }
  }

  getLatestInvestments() async {
    List<Investment> latestInvestment = sl<List<Investment>>();
    if (mounted) {
      setState(() {
        _latestInvestment = latestInvestment;
      });
    }
  }

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
                        BlocBuilder<UserAuthBloc, UserAuthState>(
                          builder: (context, state) {
                            if (state is AuthenticatedState) {
                              String name = state.user.firstName;
                              return Text(
                                'Hi, $name',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height < 600
                                          ? 30
                                          : 40,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }
                            return SizedBox(height: 10);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Number of Investments',
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
                          numberOfInvestments.toString() == 'null'
                              ? '0'
                              : numberOfInvestments.toString(),
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
                              itemCount: _brokers.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                Broker broker = _brokers[index];
                                return InkWell(
                                  onTap: () => Routes.sailor.navigate(
                                    '/broker_investments_screen',
                                    transitions: [
                                      SailorTransition.slide_from_right
                                    ],
                                    params: {
                                      'brokerId': broker.id,
                                    },
                                  ),
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
                                itemCount: _latestInvestment.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  Investment latestInvestment =
                                      _latestInvestment[index];

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
                                        investmentId: latestInvestment.id,
                                        brokerId: latestInvestment.brokerId,
                                        investmentAmount:
                                            latestInvestment.amount,
                                        investmentDescription:
                                            latestInvestment.description,
                                        investmentDuration:
                                            latestInvestment.duration,
                                        investorId: latestInvestment.investorId,
                                        percentageROI:
                                            latestInvestment.percentageROI,
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
