import 'package:ff_55/features/patient/components/game/OyunAnaSayfa.dart';
import 'package:ff_55/features/patient/pages/patient_home_page.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class PatientMainPage extends StatefulWidget {
  static String route = "/patientHomePage";
  const PatientMainPage({super.key});

  @override
  State<PatientMainPage> createState() => _PatientMainPageState();
}

class _PatientMainPageState extends State<PatientMainPage> {
  
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
            icon: Icon(Icons.games_outlined, color: Colors.white,size: 30,),
            label: 'Game',
          ),
          
        ],
      ),
      body: <Widget>[
        // Container(
        //   //color: Colors.red,
        //   alignment: Alignment.center,
        //   child: const Text('Page 1'),
        // ),

        PatientHomePage(),
        OyunAnaEkrani(),
      ][currentPageIndex],
    );
  }
}