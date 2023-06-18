import 'package:ff_55/features/Login/login_textfield.dart';
import 'package:ff_55/features/Login/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/colors/colors.dart';
import '../patient/pages/patient_main_page.dart';
import 'login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String route = "/loginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
   TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 7,
                  color: Utils.mainThemeColor
                ),
                borderRadius: BorderRadius.circular(100)
              ),
              child: const Icon(Icons.medical_information_rounded, color: Utils.mainThemeColor, size: 45)
            ),


            const SizedBox(height: 30),

           Text('Welcome to', style: GoogleFonts.roboto(color: Colors.grey, fontSize: 15,)),
          
          Text('Alzheimer \nDostu', 
            style: GoogleFonts.roboto(color: Utils.mainThemeColor, fontSize: 30)),


            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                     Text('Sign Into Your Account', 
                         textAlign: TextAlign.center, 
                         style: GoogleFonts.roboto(color: Colors.grey, fontSize: 12)
                    ),

                    const SizedBox(height: 10),

                    LoginTextField(icon: Icons.email,
                     hintText: "E-Posta Girin ",
                    isPasswordField: false, 
                    controller: emailController, 
                    onChanged: (text) {
                          setState(() {});
                        },),

                    
                    
                    const SizedBox(height: 20),

                  
                    LoginTextField(icon: Icons.lock,
                     hintText: "Şifre Girin",
                    isPasswordField: true, 
                    controller: passwordController, 
                    onChanged: (text) {
                          setState(() {});
                        },),
                  ]
                )
              )
            ),

            LoginButton(
              label: 'Giriş',
              enabled: true,
              onTap: () {
                context.go(PatientMainPage.route);
              }
            ),

            const SizedBox(height: 10),

            LoginButton(
              label: 'Kayıt',
              icon: Icons.account_circle,
              backgroundColor: Utils.mainThemeColor.withOpacity(0.05),
              iconColor: Utils.mainThemeColor,
              labelColor: Utils.mainThemeColor,
              onTap: () {
                GoRouter.of(context).go(AccountRegistrationPage.route);
              },
            ) 
          ]
        ),
      ),
    );
  }
}

