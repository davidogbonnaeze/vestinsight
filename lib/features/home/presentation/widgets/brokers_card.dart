import 'package:flutter/material.dart';

class BrokersCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .1),
      alignment: Alignment.centerLeft,
      child: Text(
        'Latest Investments',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white70,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
