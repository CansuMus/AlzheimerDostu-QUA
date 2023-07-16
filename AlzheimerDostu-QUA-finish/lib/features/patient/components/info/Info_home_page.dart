import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_55/features/patient/components/info/%C4%B1nfo_form_page.dart';

import 'package:ff_55/styles/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User {

  final String? tcNo;
  final String? gender;
  final String? birthDate;
  final String? allergies;
  final String? medications;
  final String? hospitalizations;
  final String? otherDetails;
  final String? friendName;

  User({

    this.friendName,
    this.tcNo,
    this.gender,
    this.birthDate,
    this.allergies,
    this.medications,
    this.hospitalizations,
    this.otherDetails,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(

      friendName:json['friendName'],
      tcNo: json['tcNo'],
      gender: json['gender'],
      birthDate: json['birthDate'],
      allergies: json['allergies'],
      medications: json['medications'],
      hospitalizations: json['hospitalizations'],
      otherDetails: json['otherDetails'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'friendName':friendName,
      'tcNo': tcNo,
      'gender': gender,
      'birthDate': birthDate,
      'allergies': allergies,
      'medications': medications,
      'hospitalizations': hospitalizations,
      'otherDetails': otherDetails,
    };
  }
}

class InfoHomePage extends StatelessWidget {
  const InfoHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.mainThemeColor,
        title: Text("Bilgilerim"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return InfoFormPage();
            }),
          );
        },
        label: Text(
          "Bilgilerini Gir/\nGüncelle",
          style: TextStyle(fontSize: 20),
        ),
        icon: Icon(
          Icons.create,
          size: 40,
        ),
        backgroundColor: Utils.mainThemeColor,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.exists) {
            Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;
            User user = User.fromJson(userData);

            return SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InfoContainer(
                          label: "Adı ve Soyadı",
                          value: user.friendName?? "",
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: InfoContainer(
                          label: "TC NO",
                          value: user.tcNo ?? "",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: InfoContainer(
                          label: "Cinsiyet",
                          value: user.gender ?? "",
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: InfoContainer(
                          label: "Doğum Günü",
                          value: user.birthDate ?? "",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: InfoContainer(
                          label: "Alerjisi var mı?",
                          value: user.allergies ?? "",
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: InfoContainer(
                          label: "Kullandığı İlaçlar",
                          value: user.medications ?? "",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: InfoContainer(
                          label: "Hastane Yatışları veya Hasta Dışı Tedaviler",
                          value: user.hospitalizations ?? "",
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: InfoContainer(
                          label: "Belirtmek istediği başka bir şey",
                          value: user.otherDetails ?? "",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  final String label;
  final String value;

  const InfoContainer({Key? key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
