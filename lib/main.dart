import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sailor/sailor.dart';
import 'package:vestinsight/features/home/presentation/pages/home_screen.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/bloc.dart';
import 'package:vestinsight/features/login/presentation/pages/login_screen.dart';
import 'package:vestinsight/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:vestinsight/features/onboarding/presentation/pages/walkthrough_screens.dart';
import 'package:vestinsight/injection_container.dart' as di;
import 'package:vestinsight/routes.dart';

import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupLocator();
  Routes.createRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      child: BlocProvider<UserAuthBloc>(
        create: (context) => sl<UserAuthBloc>()..add(AppStartedEvent()),
        child: BlocListener<UserAuthBloc, UserAuthState>(
          listener: (context, state) {
            if (state is AuthenticatedState) {
              return Routes.sailor.navigate('/home_screen',
                  navigationType: NavigationType.pushReplace,
                  transitions: [SailorTransition.slide_from_right]);
            }
            if (state is UnauthenticatedState) {
              return Routes.sailor.navigate('/login_screen',
                  navigationType: NavigationType.pushReplace,
                  transitions: [SailorTransition.slide_from_right]);
            }
            return null;
          },
          child: MaterialApp(
            navigatorObservers: [BotToastNavigatorObserver()],
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Color(0xff347AF0),
            ),
            onGenerateRoute: Routes.sailor.generator(),
            navigatorKey: Routes.sailor.navigatorKey,
            home: BlocBuilder<UserAuthBloc, UserAuthState>(
                builder: (context, state) {
              if (state is InitialUserAuthState) {
                return SplashScreen();
              }
              if (state is UnauthenticatedState) {
                return LoginScreen();
              }
              if (state is FirstTimeAuthState) {
                return WalkThroughScreen();
              }
              if (state is AuthenticatedState) {
                return HomeScreen();
              }
              return Container();
            }),
          ),
        ),
      ),
    );
  }
}
