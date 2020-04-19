import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _editProfileFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          iconSize: 20,
          color: Colors.black45,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.chevron_left),
            iconSize: 20,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Edit Profile',
              style: TextStyle(color: Colors.black45, fontSize: 20),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _editProfileFormKey,
                child: Column(
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
                    FlatButton(
                        onPressed: () => print('handle image'),
                        child: Text(
                          'Change Profile Image',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 15),
                        )),
                    TextFormField(
                      initialValue: 'David',
                      style: TextStyle(fontSize: 13),
                      cursorColor: Color(0xFF3D4C63),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        labelText: 'Firstname',
                        labelStyle: TextStyle(fontWeight: FontWeight.w400),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF3D4C63), width: 0.3),
                        ),
                      ),
                      validator: (input) => input.trim().length > 100
                          ? 'Bio cannot be more than 100 characters'
                          : null,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: 'Ernest',
                      style: TextStyle(fontSize: 13),
                      cursorColor: Color(0xFF3D4C63),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        labelText: 'Lastname',
                        labelStyle: TextStyle(fontWeight: FontWeight.w400),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF3D4C63), width: 0.3),
                        ),
                      ),
                      validator: (input) => input.trim().length > 100
                          ? 'Bio cannot be more than 100 characters'
                          : null,
                    ),
                    Container(
                      margin: EdgeInsets.all(40),
                      height: 40,
                      width: 200,
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        shape: StadiumBorder(),
                        onPressed: _submit,
                        child: Text(
                          'Save Profile',
                          style: TextStyle(fontSize: 16),
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

  _submit() {}
}
