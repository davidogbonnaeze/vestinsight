import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:vestinsight/core/services/auth_service.dart';
import 'package:vestinsight/injection_container.dart';
import '../../../../routes.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthService authService = sl<AuthService>();
  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      try {
        yield LoginLoadingState();
        FirebaseUser user = await authService.signInWithEmailAndPassword(
            event.email, event.password);
        yield LoginSuccessState(user: user);
        print('login success');
      } catch (e) {
        yield LoginFailState(message: e.toString());
      }
    }
  }
}
