import 'package:flutter/material.dart';

import '../../../../routes.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<InvestmentCard> investmentCards = [];
  List<WatchingCards> watchingCards = [];
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 10; i++) {
      investmentCards.add(InvestmentCard());
      watchingCards.add(WatchingCards());
    }
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
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * .15,
                        width: MediaQuery.of(context).size.height * .15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage('assets/images/dave.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Ernest David',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height < 600
                                  ? 22
                                  : 22,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'decospurs@gmail.com',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height < 600
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
                    padding: EdgeInsets.all(0),
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
                    padding: EdgeInsets.all(0),
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
          _currentScreen == 0
              ? Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10, 0, 10),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Investments',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: investmentCards,
                    ),
                  ],
                )
              : Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10, 0, 10),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Watching',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: watchingCards,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class InvestmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        height: MediaQuery.of(context).size.height < 600
            ? 200
            : MediaQuery.of(context).size.height * 0.27,
        width: MediaQuery.of(context).size.width * .9,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.6),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class WatchingCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        height: MediaQuery.of(context).size.height < 600
            ? 200
            : MediaQuery.of(context).size.height * 0.27,
        width: MediaQuery.of(context).size.width * .9,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
