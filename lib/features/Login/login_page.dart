import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../styles/colors/colors.dart';
import '../companion/LoginForCompanion/login_textfield.dart';
import '../companion/LoginForCompanion/registration_page.dart';
import '../companion/LoginForCompanion/social_iconPage.dart';
import '../patient/pages/patient_main_page.dart';
import 'login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static String route = "/loginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;


  void signUserIn() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Giriş başarılı ise Firestore'da kullanıcı belgesini oluşturma veya güncelleme işlemini yapabilirsiniz
      User user = FirebaseAuth.instance.currentUser!;
      if (user != null) {
        String userId = user.uid;
        DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(userId);

        Map<String, dynamic> userData = {
          'displayName': user.displayName,
          'email': user.email,
          'photoURL': user.photoURL,
          // Diğer verileri buraya ekleyebilirsiniz
        };

        await userDocRef.set(userData, SetOptions(merge: true));
        print('Kullanıcı verileri Firestore\'a kaydedildi');
      }

      // Giriş başarılı ise yönlendirme yapabilirsiniz
      GoRouter.of(context).go(PatientMainPage.route);
    } catch (e) {
      // Giriş başarısız ise hata mesajını gösterebilirsiniz
      print('Giriş hatası: $e');
      showAlertDialog('Giriş sırasında bir hata oluştu. Lütfen tekrar deneyin.');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Future<void> _signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //     context.go(PatientMainPage.route);
  //   } catch (e) {
  //     print('Google sign-in error: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                  const SizedBox(height: 30),
                  Text(
                    'Hoşgeldiniz',
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
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 20),

                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        LoginButton(
                          label: 'Giriş',
                          enabled: true,
                          onTap: signUserIn,
                        ),
                        const SizedBox(height: 10),
                        LoginButton(
                          label: 'Kayıt',
                          icon: Icons.account_circle,
                          backgroundColor:
                          Utils.mainThemeColor.withOpacity(0.05),
                          iconColor: Utils.mainThemeColor,
                          labelColor: Utils.mainThemeColor,
                          onTap: () {
                            GoRouter.of(context)
                                .go(AccountRegistrationPage.route);
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
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
  void showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hata'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}
