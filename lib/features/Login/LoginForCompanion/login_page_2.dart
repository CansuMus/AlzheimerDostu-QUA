import 'package:ff_55/features/Login/LoginForCompanion/login_textfield.dart';
import 'package:ff_55/features/Login/LoginForCompanion/registration_page.dart';
import 'package:ff_55/features/Login/LoginForCompanion/social_iconPage.dart';
import 'package:ff_55/features/companion/pages/companion_main_page.dart';

import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../splash/selection_screen.dart';
import 'login_button.dart';

class LoginPageForCompanion extends StatefulWidget {
  const LoginPageForCompanion({Key? key}) : super(key: key);

  static String route = "/LoginPageForCompanionForCompanion";

  @override
  State<LoginPageForCompanion> createState() => _LoginPageForCompanionState();
}

class _LoginPageForCompanionState extends State<LoginPageForCompanion> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      context.go(CompanionMainPage.route);
    } catch (e) {
      print('Google sign-in error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>SelectionScreen()));
          },



        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(width: 7, color: Utils.mainThemeColor),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Icons.medical_information_rounded,
                    color: Utils.mainThemeColor,
                    size: 45,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Welcome to',
                style: GoogleFonts.roboto(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Alzheimer Dostu',
                style: GoogleFonts.roboto(
                  color: Utils.mainThemeColor,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Sign Into Your Account',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      LoginTextField(
                        icon: Icons.email,
                        hintText: "E-Posta Girin",
                        isPasswordField: false,
                        controller: emailController,
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 20),
                      LoginTextField(
                        icon: Icons.lock,
                        hintText: "Şifre Girin",
                        isPasswordField: true,
                        controller: passwordController,
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(
                    icon: Icons.facebook,
                    onPressed: () {
                      context.go(CompanionMainPage.route);
                      // Facebook ile giriş yapma işlemleri
                    },
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () async {
                      await _signInWithGoogle();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  SocialIcon(
                    icon: Icons.window,
                    onPressed: () {
                      // Microsoft ile giriş yapma işlemleri
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    LoginButton(
                      label: 'Giriş',
                      enabled: true,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanionMainPage()));
                      },
                    ),
                    const SizedBox(height: 10),
                    LoginButton(
                      label: 'Kayıt',
                      icon: Icons.account_circle,
                      backgroundColor: Utils.mainThemeColor.withOpacity(0.05),
                      iconColor: Utils.mainThemeColor,
                      labelColor: Utils.mainThemeColor,
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountCompanionRegistrationPage()));
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}