import 'package:flutter/material.dart';

import '../../../../routes.dart';

class InvestmentScreen extends StatefulWidget {
  @override
  _InvestmentScreenState createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          iconSize: 25,
          color: Colors.black45,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.visibility),
            iconSize: 20,
            color: Colors.black45,
            onPressed: () {},
          )
        ],
        title: Center(
          child: Text(
            'Investment',
            style: TextStyle(color: Colors.black45, fontSize: 20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Text(
                    'Ginger Farm Investment, Osun state',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/dave.jpg'),
                  backgroundColor: Colors.white,
                  radius: 26,
                )
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.3),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    'In Progress',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    image: DecorationImage(
                        image: AssetImage('assets/images/cowrywise.png')),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                )
              ],
            ),
            SizedBox(height: 70),
            Row(
              children: <Widget>[
                Text(
                  'Amount:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                SizedBox(width: 20),
                Text(
                  '₦50,000',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Text(
                  'Date of Investment:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                SizedBox(width: 20),
                Text(
                  '12 Sept 2019',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Text(
                  'Duration of Investment:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                SizedBox(width: 20),
                Text(
                  '6 months',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Text(
                  'Percentage ROI:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                SizedBox(width: 20),
                Text(
                  '20%',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Text(
                  'Proof of investment',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => Routes.sailor.navigate('/view_image_screen'),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.4),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/proof_of_investment.jpeg')),
                    ),
                  ),
                  Container(
                    height: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.touch_app,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Tap to Expand',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
