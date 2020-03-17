import 'package:flutter/material.dart';

class AddInvestmentsScreen extends StatefulWidget {
  @override
  _AddInvestmentsScreenState createState() => _AddInvestmentsScreenState();
}

class _AddInvestmentsScreenState extends State<AddInvestmentsScreen> {
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
            color: Colors.white,
            onPressed: () {},
          )
        ],
        title: Center(
          child: Text(
            'Add Investment',
            style: TextStyle(color: Colors.black45, fontSize: 20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
      ),
    );
  }
}
