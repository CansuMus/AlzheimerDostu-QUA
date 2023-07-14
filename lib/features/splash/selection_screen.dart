import 'package:ff_55/routes/app_routes.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Login/LoginForCompanion/login_page.dart';
import '../Login/loginForPatient/patient_login_page.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});
  static const String route = "/selectionScreen";
  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.mainThemeColor,
        elevation: 0,
      ),
      backgroundColor: Utils.mainThemeColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:40.0),
            child: Center(
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Alzheimer Dostu’na Hoşgeldiniz",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Teşekkürler, Şimdi bir profil oluşturmamız gerekiyor",
            style: TextStyle(
                color: Colors.white,  fontSize: 16),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            "Lütfen sizi en iyi tanımlayan seçeneği seçiniz",
            style: TextStyle(
                color: Colors.white,  fontSize: 16),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //TextButton(onPressed: (){context.go(LoginPageForCompanion.route);}, child: Text("Hasta Yakını")),

              Expanded(
                child: InkWell(
                  onTap:(){
                  //   Future.delayed(const Duration(seconds: 2), () {
                  //     //Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPageForCompanion()))
                      
                  // ;});

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  
                  },
                  child: Column(
                    children: [
                      Image.asset("assets/images/hastaYakını_foto.png"),
                      SizedBox(height: 8),
                      Text(
                        "Hasta Yakınıyım",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(
                width: 30,
              ),



              //TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));}, child: Text("Hasta")),
              
              Expanded(
                child: InkWell(
                  onTap:(){
                    // Future.delayed(const Duration( seconds: 2), () {
                    //   //context.go(LoginScreen)
                    //   ;});
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientLoginPage()));
                  },
                  child: Column(
                    children: [
                      Image.asset("assets/images/hasta_foto.png"),
                      SizedBox(height: 8),
                      Text(
                        "Hastayım",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              ),


            ],
          )
        ],
      ),
    );
  }
}