import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vestinsight/features/onboarding/domain/repositories/auth_service.dart';
import 'package:vestinsight/injection_container.dart';
import 'package:vestinsight/routes.dart';
import './bloc.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  AuthService _authService = sl<AuthService>();
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
          FirebaseUser user = await _authService.getCurrentUser();
          yield AuthenticatedState(user: user);
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
      print('sign out');
    }
    if (event is SignUpSuccessfulEvent) {
      yield AuthenticatedState(user: event.currentUser);
    }
    if (event is LoginSuccessfulEvent) {
      yield AuthenticatedState(user: event.currentUser);
    }
  }

  isFirstTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0);
    print(counter);
    bool isFirstTimer = counter < 1;
    counter++;
    prefs.setInt('counter', counter);
    return isFirstTimer;
  }
}
