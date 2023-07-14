import 'package:ff_55/features/companion/pages/companion_home_page.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../Login/LoginForCompanion/login_page.dart';



class CompanionMainPage extends StatefulWidget {
  static String route = "/companionHomePage";
  const CompanionMainPage({super.key});

  @override
  State<CompanionMainPage> createState() => _CompanionMainPageState();
}

class _CompanionMainPageState extends State<CompanionMainPage> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: Utils.mainThemeColor,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.white, size: 30,),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.logout, color: Colors.white, size: 30,),
            label: 'Out',
          ),
        ],
      ),
      body: <Widget>[
        // Container(
        //   //color: Colors.red,
        //   alignment: Alignment.center,
        //   child: const Text('Page 1'),
        // ),

        CompanionHomePage(),

        Container(
          child: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));


              },
              child: const Text('Çıkış Yap'),
            ),
          ),
        )

      ][currentPageIndex],
    );
  }
}