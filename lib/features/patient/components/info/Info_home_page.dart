import 'package:ff_55/features/patient/components/info/%C4%B1nfo_form_page.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class InfoHomePage extends StatelessWidget {
  const InfoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.mainThemeColor,
        title: Text("Bilgilerim"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return InfoFormPage();
          }));
        },
        label: Text(
          "Form Oluştur/\nGüncelle",
          style: TextStyle(fontSize: 20),
        ),
        icon: Icon(
          Icons.create,
          size: 40,
        ),
        backgroundColor: Utils.mainThemeColor,
      ),
      body: Column(children: []),
    );
  }
}
