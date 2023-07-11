import 'package:ff_55/features/patient/components/game/OyunAnaSayfa.dart';
import 'package:ff_55/features/patient/pages/my_profile_page.dart';
import 'package:ff_55/features/patient/pages/patient_home_page.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PatientMainPage extends StatefulWidget {
  static String route = "/patientHomePage";

  const PatientMainPage({Key? key}) : super(key: key);

  @override
  State<PatientMainPage> createState() => _PatientMainPageState();
}

class _PatientMainPageState extends State<PatientMainPage> {
  User? user = FirebaseAuth.instance.currentUser;

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
            icon: Icon(Icons.home, color: Colors.white, size: 30),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.games_outlined, color: Colors.white, size: 30),
            label: 'Game',
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: Colors.white, size: 30),
            label: 'Info',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          PatientHomePage(),
          OyunAnaEkrani(),
          ProfilePage(user: user!),
        ],
      ),
    );
  }
}
