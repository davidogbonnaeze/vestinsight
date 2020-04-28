import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vestinsight/core/services/auth_service.dart';
import '../../../../injection_container.dart';
import './bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  AuthService authService = sl<AuthService>();
  @override
  SignUpState get initialState => SignUpInitialState();

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignUpButtonPressed) {
      try {
        yield SignUpLoadingState();
        FirebaseUser user = await authService.signUpUserWithEmailPass(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          password: event.password,
        );
        yield SignUpSuccessState(user: user);
      } catch (e) {
        yield SignUpFailedState(errorMessage: e.toString());
      }
    }
  }
}
