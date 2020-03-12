import 'package:sailor/sailor.dart';
import 'package:vestinsight/features/onboarding/presentation/pages/login_screen.dart';
import 'package:vestinsight/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:vestinsight/features/onboarding/presentation/pages/walkthrough_screens.dart';

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      // Just for good measure, we won't explicitly navigate to the InitialPage.
      SailorRoute(
        name: '/splash_screen',
        builder: (context, args, params) {
          return SplashScreen();
        },
      ),
      SailorRoute(
        name: '/walkthrough_screen',
        builder: (context, args, params) {
          return WalkThroughScreen();
        },
      ),
      SailorRoute(
        name: '/login_screen',
        builder: (context, args, params) {
          return LoginScreen();
        },
      ),
    ]);
  }
}
