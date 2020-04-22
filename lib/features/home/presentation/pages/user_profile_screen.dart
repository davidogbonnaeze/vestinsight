import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vestinsight/features/home/data/local/models/investment_model.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import 'package:vestinsight/features/home/presentation/widgets/elevated_investment_card.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/bloc.dart';

import '../../../../routes.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int _currentScreen = 0;

  _buildDisplayInvestments() {
    if (_currentScreen == 0) {
      List<ElevatedInvestmentCard> investmentCards = [];
      for (InvestmentModel investment in investments) {
        if (investment.investorId == 'assets/images/dave.jpg') {
          investmentCards.add(ElevatedInvestmentCard(
            brokerImageURL: investment.brokerId,
            investorName: investment.investorName,
            investmentAmount: investment.amount,
            investmentDescription: investment.description,
            investmentDuration: investment.duration,
            investorImageURL: investment.investorId,
            percentageROI: investment.percentageROI,
          ));
        }
      }
      return investmentCards;
    } else {
      List<ElevatedInvestmentCard> watchingCards = [];
      for (InvestmentModel investment in investments) {
        watchingCards.add(ElevatedInvestmentCard(
          brokerImageURL: investment.brokerId,
          investorName: investment.investorName,
          investmentAmount: investment.amount,
          investmentDescription: investment.description,
          investmentDuration: investment.duration,
          investorImageURL: investment.investorId,
          percentageROI: investment.percentageROI,
        ));
      }
      return watchingCards;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: SizedBox.shrink(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            iconSize: 20,
            color: Colors.black45,
            onPressed: () {
              Routes.sailor.navigate('/settings_screen');
            },
          )
        ],
        title: Center(
          child: Text(
            'User Profile',
            style: TextStyle(color: Colors.black45, fontSize: 20),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<UserAuthBloc, UserAuthState>(
                  builder: (context, state) {
                    if (state is AuthenticatedState) {
                      User user = state.user;
                      print(user.profileImageUrl);
                      String userName = '${user.firstName} ${user.lastName}';
                      String email = '${user.email}';
                      return Padding(
                        padding: EdgeInsets.only(left: 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * .13,
                              width: MediaQuery.of(context).size.height * .13,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    image: user.profileImageUrl.isEmpty
                                        ? AssetImage(
                                            'assets/images/placeholder.png')
                                        : CachedNetworkImageProvider(
                                            user.profileImageUrl),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  userName,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height < 600
                                            ? 22
                                            : 22,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  email,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height < 600
                                            ? 15
                                            : 15,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height < 600
                ? MediaQuery.of(context).size.height * .1
                : MediaQuery.of(context).size.height * .08,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.view_agenda,
                      size: 20,
                      color: _currentScreen == 0
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _currentScreen = 0;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.visibility,
                      size: 20,
                      color: _currentScreen == 1
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _currentScreen = 1;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.black45,
            height: 1,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10, 0, 10),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    _currentScreen == 0 ? 'My Investments' : 'Watching',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Column(
                children: _buildDisplayInvestments(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
