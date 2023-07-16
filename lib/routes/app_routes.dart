import 'package:ff_55/features/Login/LoginForCompanion/login_page_2.dart';
import 'package:ff_55/features/Login/LoginForCompanion/login_page.dart';
import 'package:ff_55/features/companion/pages/companion_main_page.dart';
import 'package:ff_55/features/patient/go_home/go_home_page.dart';
import 'package:ff_55/features/patient/pages/patient_main_page.dart';
import 'package:ff_55/features/splash/onboarding_screen.dart';
import 'package:ff_55/features/splash/selection_screen.dart';
import 'package:ff_55/features/splash/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/Login/LoginForCompanion/auth_page.dart';
import '../features/Login/loginForPatient/patient_login_page.dart';
import '../features/patient/patient_contact/patient_contact_page.dart';
import '../features/splash/splash_page.dart';

class Keys {
  static GlobalKey<NavigatorState> mainNav = GlobalKey();
  static GlobalKey<NavigatorState> tabNav = GlobalKey();
  static GlobalKey<ScaffoldState> mainScaffold = GlobalKey();
}

class AppRoutes {
  static GoRouter router = GoRouter(
      //initialLocation: StartScreen.route,
      navigatorKey: Keys.mainNav,
      routes: [
        GoRoute(
          path: "/", //SplashPage.route,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: AuthPage.route,
          builder: (context, state) => const AuthPage(),
        ),
        GoRoute(
          path: StartScreen.route, //SplashPage.route,
          builder: (context, state) => const StartScreen(),
        ),
        GoRoute(
          path: OnBoardingScreen.route, //SplashPage.route,
          builder: (context, state) => const OnBoardingScreen(),
        ),
        GoRoute(
          path: SelectionScreen.route, //SplashPage.route,
          builder: (context, state) => const SelectionScreen(),
        ),

        GoRoute(
          path: LoginPageForCompanion.route,
          builder: (context, state) => const LoginPageForCompanion(),
        ),

        GoRoute(
          path: LoginScreen.route,
          builder: (context, state) =>  LoginScreen(),
        ),

        GoRoute(
          path: PatientLoginPage.route,
          builder: (context, state) =>  PatientLoginPage(),
        ),

        

         
        GoRoute(
          path: PatientMainPage.route,
          builder: (context, state) => const PatientMainPage(),
        ),
        GoRoute(
          path: CompanionMainPage.route,
          builder: (context, state) => const CompanionMainPage(),
        ),

        GoRoute(
          path: PatientContactPage.route,
          builder: (context, state) => const PatientContactPage(),
        ),

        GoRoute(
          path: GoHome.route,
          builder: (context, state) => const GoHome(),
        ),


        

      ]);
}
