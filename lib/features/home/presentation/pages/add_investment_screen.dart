import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import 'package:vestinsight/features/home/presentation/blocs/add_investment/add_investment_bloc.dart';
import 'package:vestinsight/features/home/presentation/blocs/add_investment/add_investment_event.dart';
import 'package:vestinsight/features/home/presentation/blocs/add_investment/add_investment_state.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/bloc.dart';

import '../../../../injection_container.dart';

class AddInvestmentsScreen extends StatefulWidget {
  @override
  _AddInvestmentsScreenState createState() => _AddInvestmentsScreenState();
}

class _AddInvestmentsScreenState extends State<AddInvestmentsScreen> {
  File _image;
  final _formKey = GlobalKey<FormState>();
  bool loggingIn = false;
  List<Broker> _brokers;
  String _brokerId;
  String _investmentDescription;
  String _amount;
  String _investmentDuration;
  String _investmentDate;
  String _roi;
  bool submitting = false;
  final format = DateFormat("dd-MMMM-yyyy");
  final FocusNode _selectBrokerFocus = FocusNode();
  final FocusNode _investmentDescriptionFocus = FocusNode();
  final FocusNode _amountFocus = FocusNode();
  final FocusNode _investmentDurationFocus = FocusNode();
  final FocusNode _roiFocus = FocusNode();
  AddInvestmentBloc _addInvestmentBloc;
  User currentUser;

  @override
  void initState() {
    super.initState();
    getBrokers();
    _addInvestmentBloc = sl<AddInvestmentBloc>();
    currentUser = BlocProvider.of<UserAuthBloc>(context).state.props[0];
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
      body: BlocProvider<AddInvestmentBloc>(
        create: (_) => _addInvestmentBloc,
        child: BlocListener<AddInvestmentBloc, AddInvestmentState>(
            listener: (context, state) {
              if (state is AddInvestmentLoadingState) {
                BotToast.showCustomLoading(
                    clickClose: false,
                    allowClick: true,
                    backButtonBehavior: BackButtonBehavior.none,
                    ignoreContentClick: false,
                    backgroundColor: Color(0x42000000),
                    align: Alignment.center,
                    toastBuilder: (cancelFunc) {
                      return Card(
                        shape: RoundedRectangleBorder(),
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: CircularProgressIndicator(
                            backgroundColor: Theme.of(context).primaryColor,
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      );
                    });
              }
              if (state is AddInvestmentSuccessState) {
                BotToast.closeAllLoading();
                BotToast.showNotification(
                  leading: (cancel) => SizedBox.fromSize(
                      size: const Size(40, 40),
                      child: IconButton(
                        icon: Icon(Icons.done,
                            color: Theme.of(context).primaryColor),
                        onPressed: cancel,
                      )),
                  title: (_) => Text('Investment Created Succesfully',
                      style: TextStyle(fontSize: 16)),
                  enableSlideOff: true,
                  backButtonBehavior: BackButtonBehavior.none,
                  crossPage: true,
                  contentPadding: EdgeInsets.all(2),
                  onlyOne: true,
                  animationDuration: Duration(milliseconds: 200),
                  animationReverseDuration: Duration(milliseconds: 200),
                  duration: Duration(seconds: 5),
                );
                setState(() {
                  _formKey.currentState.reset();
                  submitting = false;
                  _image = null;
                });
              }
              if (state is AddInvestmentFailureState) {
                BotToast.closeAllLoading();
                BotToast.showCustomLoading(
                    clickClose: true,
                    allowClick: true,
                    backButtonBehavior: BackButtonBehavior.none,
                    ignoreContentClick: false,
                    backgroundColor: Color(0x42000000),
                    align: Alignment.center,
                    toastBuilder: (cancelFunc) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Text(state.message),
                        ),
                      );
                    });
              }
            },
            child: ListView(
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
                                focusNode: _investmentDescriptionFocus,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(fontSize: 13),
                                cursorColor: Color(0xFF3D4C63),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  labelText: 'Investment Desciption',
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.w400),
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
                                validator: (input) => input.trim().length >
                                            100 ||
                                        input.isEmpty
                                    ? 'Description must be between 1-100 characters'
                                    : null,
                                onSaved: (input) =>
                                    _investmentDescription = input,
                                onFieldSubmitted: (_) => _fieldFocusChange(
                                    context,
                                    _investmentDescriptionFocus,
                                    _selectBrokerFocus),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none,
                                  labelText: 'Select Broker',
                                  filled: false,
                                ),
                                child: DropdownButton(
                                    value: _brokerId,
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
                                        _brokerId = newValue;
                                      });
                                    },
                                    items: [
                                      for (var broker in _brokers)
                                        DropdownMenuItem<String>(
                                            value: broker.id,
                                            child: Text(broker.name))
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                focusNode: _amountFocus,
                                style: TextStyle(fontSize: 13),
                                cursorColor: Color(0xFF3D4C63),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  labelText: 'Amount',
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.w400),
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
                                onSaved: (input) => _amount = input,
                                onFieldSubmitted: (_) => _fieldFocusChange(
                                    context,
                                    _amountFocus,
                                    _investmentDurationFocus),
                                validator: (input) => input.isEmpty
                                    ? 'Amount cannot be empty'
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: TextFormField(
                                focusNode: _investmentDurationFocus,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                style: TextStyle(fontSize: 13),
                                cursorColor: Color(0xFF3D4C63),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  labelText: 'Investment Duration (Months)',
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.w400),
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
                                onSaved: (input) => _investmentDuration = input,
                                validator: (input) => input.isEmpty
                                    ? 'Investment Duration cannot be empty'
                                    : null,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Date of Investment',
                                  labelStyle: TextStyle(
                                    color: submitting && _investmentDate == null
                                        ? Colors.red
                                        : Colors.black45,
                                  ),
                                  border: InputBorder.none,
                                  filled: false,
                                ),
                                child: DateTimeField(
                                  validator: (input) => input.toString().isEmpty
                                      ? 'Date cannot be empty'
                                      : null,
                                  format: format,
                                  onChanged: (input) {
                                    if (input != null) {
                                      setState(() {
                                        _investmentDate = format.format(input);
                                      });
                                    }
                                  },
                                  onSaved: (input) {
                                    _investmentDate = format.format(input);
                                  },
                                  onShowPicker: (context, currentValue) {
                                    return showDatePicker(
                                        context: context,
                                        firstDate: DateTime(2020),
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2100));
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                focusNode: _roiFocus,
                                style: TextStyle(fontSize: 13),
                                cursorColor: Color(0xFF3D4C63),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  labelText: 'ROI (%)',
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.w400),
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
                                onSaved: (input) => _roi = input,
                                validator: (input) => input.isEmpty
                                    ? 'ROI cannot be empty'
                                    : null,
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
                                      labelStyle: TextStyle(
                                        color: submitting && _image == null
                                            ? Colors.red
                                            : Colors.black45,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: _showSelectImageDialog,
                                    child: Container(
                                      height: 250,
                                      width: width,
                                      decoration: _image == null
                                          ? BoxDecoration(
                                              color: Colors.grey[300])
                                          : BoxDecoration(
                                              color: Colors.grey[300],
                                              image: DecorationImage(
                                                image: FileImage(_image),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                      child: _image == null
                                          ? Icon(
                                              Icons.add_photo_alternate,
                                              color: Colors.white,
                                              size: 60,
                                            )
                                          : SizedBox.shrink(),
                                    ),
                                  ),
                                  submitting && _image == null
                                      ? Container(
                                          padding: EdgeInsets.only(top: 2),
                                          alignment: Alignment.centerLeft,
                                          child: Text('No Image Selected',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12)),
                                        )
                                      : SizedBox.shrink()
                                ],
                              ),
                            ),
                            SizedBox(height: 50),
                            Container(
                              width: 200,
                              height: 60,
                              padding: EdgeInsets.all(10),
                              child: FlatButton(
                                shape: StadiumBorder(),
                                onPressed: _submit,
                                color: Theme.of(context).primaryColor,
                                child: Text(
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
            )),
      ),
    );
  }

  getBrokers() async {
    List<Broker> brokers = sl<List<Broker>>();
    if (mounted) {
      setState(() {
        _brokers = brokers;
        _brokerId = _brokers[0].id;
      });
    }
  }

  _showSelectImageDialog() {
    FocusScope.of(context).unfocus();
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

  _submit() async {
    setState(() {
      submitting = true;
    });
    if (_formKey.currentState.validate() &&
        _investmentDate != null &&
        _image != null) {
      _formKey.currentState.save();
      _addInvestmentBloc.add(AddInvestmentButtonPressedEvent(
          brokerId: _brokerId,
          investmentAmount: _amount,
          investmentDate: _investmentDate,
          investmentDescription: _investmentDescription,
          investmentDuration: _investmentDuration,
          proofOfInvestment: _image,
          percentageROI: _roi,
          timestamp: Timestamp.fromDate(DateTime.now()),
          investorId: currentUser.id));
    }
  }
}
