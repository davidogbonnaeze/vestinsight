import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<InvestmentCard> investmentCards = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 10; i++) {
      investmentCards.add(InvestmentCard());
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * .20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                            image: AssetImage('assets/images/david.jpg')),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .1,
            child: Placeholder(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: investmentCards,
            ),
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
