import 'package:ff_55/features/Login/login_page.dart';
import 'package:ff_55/features/Login/registration_page.dart';
import 'package:ff_55/features/patient/pages/patient_main_page.dart';
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
        
        path: LoginPage.route,
        builder: (context, state) => const LoginPage(),
      ),

       GoRoute(
        path: AccountRegistrationPage.route, //SplashPage.route,
        builder: (context, state) => const AccountRegistrationPage(),
      ),

      GoRoute(
        path: PatientMainPage.route, 
        builder: (context, state) => const PatientMainPage(),
      ),
        
    ]
  );
}