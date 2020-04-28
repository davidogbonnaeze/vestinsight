import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vestinsight/core/services/auth_service.dart';
import 'package:vestinsight/core/services/database_service.dart';
import 'package:vestinsight/core/services/storage_service.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import 'package:vestinsight/injection_container.dart';
import 'package:vestinsight/routes.dart';
import './bloc.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  AuthService _authService = sl<AuthService>();
  DataBaseService _dataBaseService = sl<DataBaseService>();
  @override
  UserAuthState get initialState => InitialUserAuthState();

  @override
  Stream<UserAuthState> mapEventToState(
    UserAuthEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      try {
        bool isSignedIn = await _authService.isSignedIn();
        if (isSignedIn) {
          await Future.delayed(Duration(seconds: 3));
          FirebaseUser firebaseUser = await _authService.getCurrentUser();
          User currentUser =
              await _dataBaseService.getUser(userId: firebaseUser.uid);
          yield AuthenticatedState(user: currentUser);
        } else {
          await Future.delayed(Duration(seconds: 3));
          if (await isFirstTimer()) {
            yield FirstTimeAuthState();
          } else {
            yield UnauthenticatedState();
          }
        }
      } catch (e) {
        yield UnauthenticatedState();
      }
    }
    if (event is LogOutEvent) {
      _authService.signOut();
      yield UnauthenticatedState();
    }
    if (event is SignUpSuccessfulEvent) {
      User currentUser =
          await _dataBaseService.getUser(userId: event.currentUser.uid);
      yield AuthenticatedState(user: currentUser);
    }
    if (event is LoginSuccessfulEvent) {
      User currentUser =
          await _dataBaseService.getUser(userId: event.currentUser.uid);
      yield AuthenticatedState(user: currentUser);
    }
    if (event is UserProfileChanged) {
      yield AuthenticatedState(user: event.user);
    }
  }

  isFirstTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0);
    bool isFirstTimer = counter < 1;
    counter++;
    prefs.setInt('counter', counter);
    return isFirstTimer;
  }
}
