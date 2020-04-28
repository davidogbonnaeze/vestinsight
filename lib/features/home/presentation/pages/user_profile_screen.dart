import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sailor/sailor.dart';
import 'package:vestinsight/features/home/data/local/models/investment_model.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import 'package:vestinsight/features/home/presentation/blocs/user_profile/bloc.dart';
import 'package:vestinsight/features/home/presentation/widgets/elevated_investment_card.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/bloc.dart';
import 'package:vestinsight/injection_container.dart';

import '../../../../routes.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int _currentScreen = 0;
  UserProfileBloc _userProfileBloc;

  _buildDisplayInvestments(
      List<Investment> watchingInvestments, List<Investment> userInvestments) {
    if (_currentScreen == 0) {
      List<ElevatedInvestmentCard> investmentCards = [];
      for (Investment investment in userInvestments) {
        investmentCards.add(ElevatedInvestmentCard(
          investmentId: investment.id,
          brokerId: investment.brokerId,
          investmentAmount: investment.amount,
          investmentDescription: investment.description,
          investmentDuration: investment.duration,
          investorId: investment.investorId,
          percentageROI: investment.percentageROI,
        ));
      }
      return investmentCards;
    } else {
      List<ElevatedInvestmentCard> watchingCards = [];
      for (Investment investment in watchingInvestments) {
        watchingCards.add(ElevatedInvestmentCard(
          investmentId: investment.id,
          brokerId: investment.brokerId,
          investmentAmount: investment.amount,
          investmentDescription: investment.description,
          investmentDuration: investment.duration,
          investorId: investment.investorId,
          percentageROI: investment.percentageROI,
        ));
      }
      return watchingCards;
    }
  }

  @override
  void initState() {
    super.initState();
    User user = BlocProvider.of<UserAuthBloc>(context).state.props[0];
    _userProfileBloc = sl<UserProfileBloc>();
    if (mounted) {
      _userProfileBloc.add(UserProfilesPageLoadedEvent(userId: user.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserProfileBloc>(
      create: (_) => _userProfileBloc,
      child: Scaffold(
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
                Routes.sailor.navigate('/settings_screen',
                    transitions: [SailorTransition.slide_from_right]);
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
                        String userName = '${user.firstName} ${user.lastName}';
                        String email = '${user.email}';
                        return Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .13,
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
                                          MediaQuery.of(context).size.height <
                                                  600
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
                                          MediaQuery.of(context).size.height <
                                                  600
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
                BlocBuilder<UserProfileBloc, UserProfileState>(
                  bloc: _userProfileBloc,
                  builder: (context, state) {
                    if (state is UserProfileSuccessState) {
                      return Column(
                        children: _buildDisplayInvestments(
                            state.watchingInvestments, state.userInvestments),
                      );
                    }
                    if (state is UserProfileLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
