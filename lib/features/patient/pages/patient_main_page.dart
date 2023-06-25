import 'package:ff_55/features/patient/pages/patient_home_page.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class PatientMainPage extends StatefulWidget {
  static String route = "/patientHomePage";

  const PatientMainPage({Key? key}) : super(key: key);

  @override
  State<PatientMainPage> createState() => _PatientMainPageState();
}

class _PatientMainPageState extends State<PatientMainPage> {
  int currentPageIndex = 0;

  final List<Widget> pages = [
    PatientHomePage(),
    Container(
      //color: Colors.green,
      alignment: Alignment.center,
      child: const Text('Page 2'),
    ),
    Container(
      //color: Colors.blue,
      alignment: Alignment.center,
      child: const Text('Page 3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Utils.mainThemeColor,
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games_outlined, color: Colors.white, size: 30),
            label: 'Game',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note, color: Colors.white, size: 30),
            label: 'Info',
          ),
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}
