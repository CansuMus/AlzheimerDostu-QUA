import 'package:ff_55/features/Login/LoginForCompanion/login_page_2.dart';
import 'package:ff_55/features/companion/pages/companion_home_page.dart';
import 'package:ff_55/features/patient/pages/patient_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage_Companion extends StatelessWidget {
  const AuthPage_Companion({Key? key}) : super(key: key);

  static String route = "/authPage";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Auth durumu bekleniyor ise yüklenme gösterebilirsiniz.
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          // Kullanıcı oturum açmış ise ana sayfayı göster.
          return CompanionHomePage();
        } else {
          // Kullanıcı oturum açmamış ise giriş sayfasını göster.
          return LoginPageForCompanion();
        }
      },
    );
  }
}
