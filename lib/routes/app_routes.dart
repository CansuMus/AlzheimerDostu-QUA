import 'package:ff_55/features/Login/login_page.dart';
import 'package:ff_55/features/Login/registration_page.dart';
import 'package:ff_55/features/companion/LoginForCompanion/login_page.dart';
import 'package:ff_55/features/companion/pages/companion_main_page.dart';
import 'package:ff_55/features/patient/pages/patient_main_page.dart';
import 'package:ff_55/features/splash/selection_screen.dart';
import 'package:ff_55/features/splash/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/splash/splash_page.dart';



class Keys {

  static GlobalKey<NavigatorState> mainNav = GlobalKey();
  static GlobalKey<NavigatorState> tabNav = GlobalKey();
  static GlobalKey<ScaffoldState> mainScaffold = GlobalKey();
}


class AppRoutes {

   static GoRouter router = GoRouter(
    //initialLocation: SplashPage.route,
    navigatorKey: Keys.mainNav,
    
    routes: [
   
       GoRoute(
        
        path: "/", //SplashPage.route,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        
        path: StartScreen.route, //SplashPage.route,
        builder: (context, state) => const StartScreen(),
      ),
       GoRoute(
        
        path: SelectionScreen.route, //SplashPage.route,
        builder: (context, state) => const SelectionScreen(),
      ),

      GoRoute(
        
        path: LoginPage.route,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        
        path: LoginPageForCompanion.route,
        builder: (context, state) => const LoginPageForCompanion(),
      ),

       GoRoute(
        path: AccountRegistrationPage.route, //SplashPage.route,
        builder: (context, state) => const AccountRegistrationPage(),
      ),

      GoRoute(
        path: PatientMainPage.route, 
        builder: (context, state) => const PatientMainPage(),
      ),
      GoRoute(
        path: CompanionMainPage.route, 
        builder: (context, state) => const CompanionMainPage(),
      ),
        
    ]
  );
}