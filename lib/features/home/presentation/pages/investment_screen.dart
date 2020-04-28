import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';

import '../../../../routes.dart';

class InvestmentScreen extends StatefulWidget {
  final Investment investment;
  final User investor;
  final Broker broker;

  const InvestmentScreen({Key key, this.investment, this.investor, this.broker})
      : super(key: key);

  @override
  _InvestmentScreenState createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen> {
  bool _isWatching = false;

  toggleWatching() {
    return _isWatching = !_isWatching;
  }

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
            color:
                _isWatching ? Theme.of(context).primaryColor : Colors.black45,
            onPressed: () {
              setState(() {
                toggleWatching();
              });
            },
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
                    widget.investment.description,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundImage: widget.investor.profileImageUrl.isEmpty
                      ? AssetImage('assets/images/placeholder.png')
                      : CachedNetworkImageProvider(
                          widget.investor.profileImageUrl),
                  backgroundColor: Colors.grey[300],
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
                        image: AssetImage(widget.broker.imgUrl)),
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
                  '₦${widget.investment.amount}',
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
                  widget.investment.investmentDate,
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
                  '${widget.investment.duration} months',
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
                  '${widget.investment.percentageROI}%',
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
              onTap: () => Routes.sailor.navigate('/view_image_screen',
                  transitions: [SailorTransition.slide_from_right],
                  params: {'imageUrl': widget.investment.proofOfInvestmentURL}),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.4),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              widget.investment.proofOfInvestmentURL)),
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
