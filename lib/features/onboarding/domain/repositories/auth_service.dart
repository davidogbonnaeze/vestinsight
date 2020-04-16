import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vestinsight/core/utils/error_codes.dart';
import 'package:flutter/services.dart';

class AuthService {
  FirebaseAuth firebaseAuth;
  static final _fireStore = Firestore.instance;
  AuthService() {
    this.firebaseAuth = FirebaseAuth.instance;
  }

  Future<FirebaseUser> signUpUserWithEmailPass(
      String firstName, String lastName, String email, String password) async {
    try {
      AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser signedInUser = authResult.user;
      if (signedInUser != null) {
        _fireStore.collection('/users').document(signedInUser.uid).setData({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
        });
      }
      print("REPO : ${authResult.user.email}");
      return authResult.user;
    } on PlatformException catch (e) {
      String authError = "";
      authError = filterErrorMessage(e, authError);
      throw Exception(authError);
    }
  }

  Future<FirebaseUser> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user;
      print(user.toString());
      return user;
    } on PlatformException catch (e) {
      print(e);
      String authError = "";
      authError = filterErrorMessage(e, authError);
      throw Exception(authError);
    }
  }

  // sign out
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // check signIn
  Future<bool> isSignedIn() async {
    var currentUser = await firebaseAuth.currentUser();
    return currentUser != null;
  }

  // get current user
  Future<FirebaseUser> getCurrentUser() async {
    return await FirebaseAuth.instance.currentUser();
  }

  String filterErrorMessage(PlatformException e, String authError) {
    switch (e.code) {
      case ErrorCodes.ERROR_C0DE_NETWORK_ERROR:
        authError = ErrorMessages.ERROR_C0DE_NETWORK_ERROR;
        break;
      case ErrorCodes.ERROR_USER_NOT_FOUND:
        authError = ErrorMessages.ERROR_USER_NOT_FOUND;
        break;
      case ErrorCodes.ERROR_TOO_MANY_REQUESTS:
        authError = ErrorMessages.ERROR_TOO_MANY_REQUESTS;
        break;
      case ErrorCodes.ERROR_INVALID_EMAIL:
        authError = ErrorMessages.ERROR_INVALID_EMAIL;
        break;
      case ErrorCodes.ERROR_CODE_USER_DISABLED:
        authError = ErrorMessages.ERROR_CODE_USER_DISABLED;
        break;
      case ErrorCodes.ERROR_CODE_WRONG_PASSWORD:
        authError = ErrorMessages.ERROR_CODE_WRONG_PASSWORD;
        break;
      case ErrorCodes.ERROR_CODE_EMAIL_ALREADY_IN_USE:
        authError = ErrorMessages.ERROR_CODE_EMAIL_ALREADY_IN_USE;
        break;
      case ErrorCodes.ERROR_OPERATION_NOT_ALLOWED:
        authError = ErrorMessages.ERROR_OPERATION_NOT_ALLOWED;
        break;
      case ErrorCodes.ERROR_CODE_WEAK_PASSWORD:
        authError = ErrorMessages.ERROR_CODE_WEAK_PASSWORD;
        break;
      default:
        authError = ErrorMessages.DEFAULT;
        break;
    }
    return authError;
  }
}
