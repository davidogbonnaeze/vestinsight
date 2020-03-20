import 'package:flutter/material.dart';

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
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
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
                            fontSize: MediaQuery.of(context).size.height < 600
                                ? 15
                                : 20,
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
                            fontSize: MediaQuery.of(context).size.height < 600
                                ? 25
                                : 40,
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
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFededed),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            height: MediaQuery.of(context).size.height * .19,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemCount: 6,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .10,
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
                                                  image: AssetImage(
                                                      'assets/images/piggyvest_transparent_bg.png'),
                                                ),
                                              ),
                                            ),
                                            Text('Piggyvest'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                          ),
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                height:
                                    MediaQuery.of(context).size.height * .24,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: 6,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: _screenHeight * .10,
                                          width: 290,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      width: 150,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          CircleAvatar(
                                                            radius: 15,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    'assets/images/dave.jpg'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text('Ernest David')
                                                        ],
                                                      ),
                                                    ),
                                                    CircleAvatar(
                                                      child: Image.asset(
                                                          'assets/images/crowdyvest.jpeg'),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Column(
                                                      children: <Widget>[
                                                        Text(
                                                          'Amount Invested',
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        SizedBox(height: 3),
                                                        Text(
                                                          '55,000',
                                                          style: TextStyle(
                                                            fontSize: 21,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Icon(Icons.trending_flat),
                                                    Column(
                                                      children: <Widget>[
                                                        Text(
                                                          'Expected Amount',
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        SizedBox(height: 3),
                                                        Text(
                                                          '75,000',
                                                          style: TextStyle(
                                                            fontSize: 21,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Column(
                                                      children: <Widget>[
                                                        Text(
                                                          'ROI',
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        SizedBox(height: 3),
                                                        Text(
                                                          '36%',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: <Widget>[
                                                        Text(
                                                          'Duration',
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        SizedBox(height: 3),
                                                        Text(
                                                          '5 Months',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: <Widget>[
                                                        Text(
                                                          'Days left',
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        SizedBox(height: 3),
                                                        Text(
                                                          '90 Days',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
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
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
