import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddInvestmentsScreen extends StatefulWidget {
  @override
  _AddInvestmentsScreenState createState() => _AddInvestmentsScreenState();
}

class _AddInvestmentsScreenState extends State<AddInvestmentsScreen> {
  File _image;
  final _formKey = GlobalKey<FormState>();
  bool loggingIn = false;
  String _dropdownValue = 'Agropartnerships';
  List<String> _brokers = [
    'Agropartnerships',
    'CowryWise',
    'CrowdyVest',
    'PiggyVest',
    'ThriveAgric'
  ];
  final FocusNode _selectBrokerFocus = FocusNode();

  _showSelectImageDialog() {
    return Platform.isIOS ? _iosBottomSheet() : _androidDialog();
  }

  _iosBottomSheet() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text('Add Photo'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('Take Photo'),
                onPressed: () => _handleImage(ImageSource.camera),
              ),
              CupertinoActionSheetAction(
                child: Text('Choose from gallery'),
                onPressed: () => _handleImage(ImageSource.gallery),
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
          );
        });
  }

  _androidDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Add Photo'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Take Photo'),
                onPressed: () => _handleImage(ImageSource.camera),
              ),
              SimpleDialogOption(
                child: Text('Select from gallery'),
                onPressed: () => _handleImage(ImageSource.gallery),
              ),
              SimpleDialogOption(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.redAccent),
                ),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  _handleImage(ImageSource source) async {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(source: source);
    if (imageFile != null) {
      setState(() {
        _image = imageFile;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    _fieldFocusChange(
        BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

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
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 10),
                        child: TextFormField(
                          maxLines: 2,
                          style: TextStyle(fontSize: 13),
                          cursorColor: Color(0xFF3D4C63),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            labelText: 'Investment Desciption',
                            labelStyle: TextStyle(fontWeight: FontWeight.w400),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF3D4C63), width: 0.3),
                            ),
                          ),
                          validator: (input) => input.trim().length > 100
                              ? 'Bio cannot be more than 100 characters'
                              : null,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            border: InputBorder.none,
                            labelText: 'Select Broker',
                            filled: false,
                          ),
                          child: DropdownButton<String>(
                            value: _dropdownValue,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            focusNode: _selectBrokerFocus,
                            iconSize: 20,
                            isExpanded: true,
                            hint: Text('Select Broker'),
                            style: TextStyle(color: Colors.black),
                            underline: Container(
                              height: .3,
                              color: Colors.black45,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                _dropdownValue = newValue;
                              });
                            },
                            items: _brokers
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 13),
                          cursorColor: Color(0xFF3D4C63),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            labelText: 'Amount',
                            labelStyle: TextStyle(fontWeight: FontWeight.w400),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF3D4C63), width: 0.3),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 13),
                          cursorColor: Color(0xFF3D4C63),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            labelText: 'Investment Duration (Months)',
                            labelStyle: TextStyle(fontWeight: FontWeight.w400),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF3D4C63), width: 0.3),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: BasicDateField(),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 13),
                          cursorColor: Color(0xFF3D4C63),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            labelText: 'ROI (%)',
                            labelStyle: TextStyle(fontWeight: FontWeight.w400),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF3D4C63), width: 0.3),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 10.0),
                        child: Column(
                          children: <Widget>[
                            InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                border: InputBorder.none,
                                labelText:
                                    'Upload Proof of Investment(E.g Screenshot of active investment on broker\'s app',
                                filled: false,
                              ),
                            ),
                            GestureDetector(
                              onTap: _showSelectImageDialog,
                              child: Container(
                                height: 250,
                                width: width,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  image: _image == null
                                      ? Icon(
                                          Icons.add_a_photo,
                                          color: Colors.white70,
                                          size: 80,
                                        )
                                      : DecorationImage(
                                          image: FileImage(_image),
                                          fit: BoxFit.fitHeight,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 80),
                      Container(
                        width: 200,
                        height: 60,
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                          shape: StadiumBorder(),
                          onPressed: _submit,
                          color: Theme.of(context).primaryColor,
                          child: loggingIn
                              ? Container(
                                  height: 16,
                                  width: 16,
                                  child: CircularProgressIndicator(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Colors.white),
                                  ),
                                )
                              : Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("dd-MMMM-yyyy");
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Date of Investment',
        border: InputBorder.none,
        filled: false,
      ),
      child: DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    );
  }
}
