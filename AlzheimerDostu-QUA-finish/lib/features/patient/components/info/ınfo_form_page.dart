import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_55/features/patient/components/info/models/text_form.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../companion/pages/companion_home_page.dart';

class InfoFormPage extends StatefulWidget {
  const InfoFormPage({Key? key});

  @override
  State<InfoFormPage> createState() => _InfoFormPageState();
}

class _InfoFormPageState extends State<InfoFormPage> {
  String selectedGender = "";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController friendnameController=TextEditingController();
  final TextEditingController tcNoController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController allergiesController = TextEditingController();
  final TextEditingController medicationsController = TextEditingController();
  final TextEditingController hospitalizationsController = TextEditingController();
  final TextEditingController otherDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: 200,
              color: Utils.mainThemeColor,
              child: Center(
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 26,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Text(
                    "Hasta Kayıt Bilgi Formu",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 0),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [

                      TextForm(
                        text: "Hasta Adı-Soyadı: ",
                        controller: friendnameController,
                      ),

                      TextForm(
                        text: "TC NO: ",
                        controller: tcNoController,
                      ),
                      selectGender(),
                      TextForm(
                        text: "Doğum Günü : ",
                        controller: birthDateController,
                      ),
                      TextForm(
                        text: "Alerjisi var mı?",
                        controller: allergiesController,
                      ),
                      TextForm(
                        text: "Kullandığı İlaçlar",
                        controller: medicationsController,
                      ),
                      TextForm(
                        text: "Lütfen geçmişte aldığınız \n tedavileri yazınız",
                        controller: hospitalizationsController,
                      ),
                      TextForm(
                        text: "Belitmek istediğiniz\n notları yazınız ",
                        controller: otherDetailsController,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Utils
                              .mainThemeColor),
                        ),
                        onPressed: () {
                          saveForm();
                        },
                        child: Text(
                          "Kaydet",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row selectGender() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Utils.mainThemeColor,
          ),
          padding: const EdgeInsets.all(10.0),
          child: const Text(
            "Cinsiyet:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Row(
          children: [
            Radio(
              value: 'Erkek',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value.toString();
                });
              },
            ),
            const Text(
              'Erkek',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 'Kadın',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value.toString();
                });
              },
            ),
            const Text(
              'Kadın',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }

  void saveForm() {
    String friendName = friendnameController.text ;
    String tcNo = tcNoController.text;
    String birthDate = birthDateController.text;
    String allergies = allergiesController.text;
    String medications = medicationsController.text;
    String hospitalizations = hospitalizationsController.text;
    String otherDetails = otherDetailsController.text;

    // Mevcut kullanıcının UID'sini al
    String userId = FirebaseAuth.instance.currentUser!.uid;

    // Firestore'de kullanıcının dokümanını bul ve güncelleme yap
    FirebaseFirestore.instance.collection('users').doc(userId).update({
      'friendName': friendName,
      'tcNo': tcNo,
      'gender': selectedGender,
      'birthDate': birthDate,
      'allergies': allergies,
      'medications': medications,
      'hospitalizations': hospitalizations,
      'otherDetails': otherDetails,
    }).then((value) {
      // Güncelleme işlemi başarılı olduğunda yapılacak işlemler
      print('Bilgiler güncellendi');
      Navigator.pop(context); // Form sayfasından çıkış yap
    }).catchError((error) {
      // Hata durumunda yapılacak işlemler
      print('Güncelleme hatası: $error');
    });
  }
}