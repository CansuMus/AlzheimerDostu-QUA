import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_55/features/patient/components/info/Info_home_page.dart';
import 'package:ff_55/features/patient/components/notes/notes_home_screen.dart';
import 'package:ff_55/features/patient/go_home/go_home_page.dart';
import 'package:ff_55/features/patient/patient_contact/patient_contact_page.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../companion/pages/companion_home_page.dart';
import '../../companion/pages/components/notes/notes_home_screen.dart';


class PatientHomePage extends StatelessWidget {
  const PatientHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.exists) {
            Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;
            String displayName = userData['friendName'];

            return Column(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: 200,
                    color: Utils.mainThemeColor,
                    child: Center(
                      child: ListTile(
                        leading: IconButton(
                          icon: Icon(Icons.menu, color: Colors.white, size: 26),
                          onPressed: () {},
                        ),
                        title: Text(
                          "Hoşgeldin, " + (displayName ?? ''),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        subtitle: Text(
                          "Umarım, güzel bir gün geçirirsin",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    crossAxisCount: 2,
                    children: <Widget>[
                      CardHome(
                        text: "Bilgilerim",
                        icon: Icons.info_sharp,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return InfoHomePage();
                            }),
                          );
                        },
                      ),
                      CardHome(
                        text: "Evim",
                        icon: Icons.home_outlined,
                        onTap: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return GoHome();
                            }),
                          );
                        },
                      ),
                      CardHome(
                        text: "Ailem",
                        icon: Icons.family_restroom,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return PatientContactPage();
                            }),
                          );
                        },
                      ),
                      CardHome(
                        text: "Notlarım",
                        icon: Icons.note_add,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Notes_Home_Screen();
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
