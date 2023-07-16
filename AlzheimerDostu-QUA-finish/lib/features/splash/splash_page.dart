import 'dart:async';
import 'package:ff_55/features/splash/start_screen.dart';
import 'package:ff_55/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../styles/colors/colors.dart';



class SplashPage extends StatelessWidget {
   const SplashPage({super.key});
  static String route = "/";

  @override
  Widget build(BuildContext context) {

     Future.delayed(const Duration(seconds: 2), () {
    GoRouter.of(Keys.mainNav.currentContext!)
      .go(StartScreen.route);});


    return Scaffold(
      backgroundColor: Utils.mainThemeColor,
      body: Stack(
        children: [
          Center(
            child: Icon(Icons.medical_information_rounded,
            color: Colors.white,
            size: 60,),
          ),

          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                color: Colors.red,
                valueColor:  AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 6,
              ),
            ),
          ),
          

        
        ],
      )
    );
  }
}