import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import 'package:vestinsight/features/home/presentation/blocs/edit_profile/bloc.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/bloc.dart';

import '../../../../injection_container.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File _profileImage;
  final _editProfileFormKey = GlobalKey<FormState>();
  EditProfileBloc _editProfileBloc;
  String _firstName;
  String _lastName;
  User currentUser;

  @override
  void initState() {
    super.initState();
    _editProfileBloc = sl<EditProfileBloc>();
    currentUser = BlocProvider.of<UserAuthBloc>(context).state.props[0];
  }

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
      body: BlocProvider<EditProfileBloc>(
          create: (_) => _editProfileBloc,
          child: BlocListener<EditProfileBloc, EditProfileState>(
            bloc: _editProfileBloc,
            listener: (context, state) {
              if (state is EditProfileSuccessState) {
                BlocProvider.of<UserAuthBloc>(context)
                    .add(UserProfileChanged(user: state.user));
              }
              if (state is EditProfileLoadingState) {
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

              if (state is EditProfileFailureState) {
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
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _editProfileFormKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * .13,
                          width: MediaQuery.of(context).size.height * .13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: displayProfileImage(currentUser),
                                fit: BoxFit.cover),
                          ),
                        ),
                        FlatButton(
                            onPressed: _handleImageFromGallery,
                            child: Text(
                              'Change Profile Image',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 15),
                            )),
                        TextFormField(
                          initialValue: '${currentUser.firstName}',
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
                              borderSide: BorderSide(
                                  color: Color(0xFF3D4C63), width: 0.3),
                            ),
                          ),
                          validator: (input) => input.trim().length < 0
                              ? 'Firstname cannot be empty'
                              : null,
                          onSaved: (input) => _firstName = input,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          initialValue: '${currentUser.lastName}',
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
                              borderSide: BorderSide(
                                  color: Color(0xFF3D4C63), width: 0.3),
                            ),
                          ),
                          validator: (input) => input.trim().length < 0
                              ? 'Lastname cannot be empty'
                              : null,
                          onSaved: (input) => _lastName = input,
                        ),
                        Container(
                          margin: EdgeInsets.all(40),
                          height: 40,
                          width: 200,
                          child: FlatButton(
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
                            shape: StadiumBorder(),
                            onPressed: () {
                              _submit(currentUser);
                            },
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
          )),
    );
  }

  _submit(User user) {
    if (_editProfileFormKey.currentState.validate()) {
      _editProfileFormKey.currentState.save();
      FocusScope.of(context).unfocus();
      _editProfileBloc.add(EditProfileButtonPressed(
          profilePicture: _profileImage,
          user: user,
          newFirstName: _firstName,
          newLastName: _lastName));
    }
  }

  _handleImageFromGallery() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      imageFile = await _cropImage(imageFile);
      setState(() {
        _profileImage = imageFile;
      });
    }
  }

  _cropImage(File imageFile) async {
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    return croppedImage;
  }

  displayProfileImage(User user) {
    if (_profileImage == null) {
      if (user.profileImageUrl.isEmpty) {
        return AssetImage('assets/images/placeholder.png');
      } else {
        return CachedNetworkImageProvider(user.profileImageUrl);
      }
    } else {
      return FileImage(_profileImage);
    }
  }
}
