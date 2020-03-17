import 'package:flutter/material.dart';

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
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Container(
                  height: MediaQuery.of(context).size.height < 600
                      ? 200
                      : MediaQuery.of(context).size.height * 0.27,
                  width: 290,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.6),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}