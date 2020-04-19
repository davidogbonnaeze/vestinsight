import 'package:sailor/sailor.dart';
import 'package:vestinsight/features/home/presentation/pages/edit_profile_screen.dart';
import 'package:vestinsight/features/home/presentation/pages/explore_investments_screen.dart';
import 'package:vestinsight/features/home/presentation/pages/home_screen.dart';
import 'package:vestinsight/features/home/presentation/pages/investment_screen.dart';
import 'package:vestinsight/features/home/presentation/pages/settings_screen.dart';
import 'package:vestinsight/features/home/presentation/pages/view_image_screen.dart';
import 'package:vestinsight/features/onboarding/presentation/pages/check_email_screen.dart';
import 'package:vestinsight/features/onboarding/presentation/pages/forgot_password_screen.dart';
import 'package:vestinsight/features/login/presentation/pages/login_screen.dart';
import 'package:vestinsight/features/signup/presentation/pages/sign_up_screen.dart';
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
      SailorRoute(
        name: '/signup_screen',
        builder: (context, args, params) {
          return SignUpScreen();
        },
      ),
      SailorRoute(
        name: '/forgot_password_screen',
        builder: (context, args, params) {
          return ForgotPasswordScreen();
        },
      ),
      SailorRoute(
        name: '/check_email_screen',
        builder: (context, args, params) {
          return CheckEmailScreen();
        },
      ),
      SailorRoute(
        name: '/home_screen',
        builder: (context, args, params) {
          return HomeScreen();
        },
      ),
      SailorRoute(
        name: '/settings_screen',
        builder: (context, args, params) {
          return SettingsScreen();
        },
      ),
      SailorRoute(
        name: '/investment_screen',
        builder: (context, args, params) {
          return InvestmentScreen();
        },
      ),
      SailorRoute(
        name: '/view_image_screen',
        builder: (context, args, params) {
          return ViewImageScreen();
        },
      ),
      SailorRoute(
        name: '/explore_investment_screen',
        builder: (context, args, params) {
          return ExploreInvestmentsScreen();
        },
      ),
      SailorRoute(
        name: '/edit_profile_screen',
        builder: (context, args, params) {
          return EditProfileScreen();
        },
      ),
    ]);
  }
}
