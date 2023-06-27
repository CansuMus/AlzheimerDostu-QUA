import 'package:ff_55/features/patient/components/info/models/text_form.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class InfoFormPage extends StatefulWidget {
  const InfoFormPage({super.key});

  @override
  State<InfoFormPage> createState() => _InfoFormPageState();
}

class _InfoFormPageState extends State<InfoFormPage> {
  String selectedGender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       elevation: 0,
       backgroundColor: Utils.mainThemeColor,
      ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/backgroundİmg.png"),
                    fit: BoxFit.fill)),
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Hasta Kayıt Bilgi Formu",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 60),
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: [
                        const TextForm(text: "Adı ve SoyAdı: "),
                        const TextForm(text: "TC NO: "),
                        selectGender(),
                        const TextForm(text: "Doğum Günü : "),
                        const TextForm(text: "Alerjisi var mı?"),
                        const TextForm(text: "Kullandığı İlaçlar"),
                        const TextForm(text: "Lütfen geçmiş herhangi bir\n  Hastaneyeyatış veya\n Hasta Dışı Tedaviyi listeleyin"),
                        const TextForm(text: "Belitmek istediğiniz başka bir şey "),
                        
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:MaterialStateProperty.all(Utils.mainThemeColor),
                          ),
                          onPressed: (){},
                          child: const Text(
                            "Kaydet",
                            style: TextStyle(
                              fontSize: 30
                            ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ])));
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
                  fontWeight: FontWeight.w700),
            )),
        Row(
          children: [
            Radio(
              value: 'Male',
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
              value: 'Female',
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
}
