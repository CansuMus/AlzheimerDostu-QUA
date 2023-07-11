import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_55/features/Login/login_button.dart';
import 'package:ff_55/features/Login/login_page.dart';
import 'package:ff_55/features/Login/login_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../styles/colors/colors.dart';
import '../patient/pages/patient_main_page.dart';

class AccountRegistrationPage extends StatefulWidget {
  AccountRegistrationPage({Key? key}) : super(key: key);
  static String route = "/accountRegistration";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  State<AccountRegistrationPage> createState() => _AccountRegistrationPageState();
}

class _AccountRegistrationPageState extends State<AccountRegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form anahtarını oluştur

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Utils.mainThemeColor),
        backgroundColor: Colors.transparent,
        title: const Icon(Icons.medical_information_rounded, color: Utils.mainThemeColor, size: 40),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey, // Form anahtarını formu doğrulamak için kullan
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    'Yeni Hesap Oluştur',
                    style: TextStyle(color: Utils.mainThemeColor, fontSize: 20),
                  ),
                ),
                LoginTextField(
                  icon: Icons.person,
                  hintText: "İsminizi giriniz",
                  isPasswordField: false,
                  controller: nameController,
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                SizedBox(height: 20),


                // email field
                LoginTextField(
                  icon: Icons.email,
                  hintText: "E-Posta Girin",
                  isPasswordField: false,
                  controller: emailController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'E-Posta alanı boş bırakılamaz';
                    } else if (!value.contains('@')) {
                      return 'Geçerli bir E-Posta adresi girin';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // E-Posta değerini kaydetme işlemleri
                  },
                ),
                SizedBox(height: 20),

                // password field
                LoginTextField(
                  icon: Icons.lock,
                  hintText: "Şifre Girin",
                  isPasswordField: true,
                  controller: passwordController,
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                SizedBox(height: 20),

                // password confirmation field
                LoginTextField(
                  icon: Icons.lock,
                  hintText: "Şifre Tekrar Girin",
                  isPasswordField: true,
                  controller: confirmPasswordController,
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                SizedBox(height: 20),

                // Kayıt butonu
            LoginButton(
              label: 'Kayıt',
              enabled: _formKey.currentState?.validate() ?? false,
              onTap: () {
                if (_formKey.currentState?.validate() == true) {
                  _formKey.currentState?.save();
                  String email = emailController.value.text;
                  String pwd = passwordController.value.text;

                  widget._auth
                      .createUserWithEmailAndPassword(email: email, password: pwd)
                      .then((userCredential) {
                    // Firebase Auth kaydı başarılı olduğunda yapılacak işlemler

                    // Kullanıcının Firestore'da kaydedilmesi
                    String userId = userCredential.user?.uid ?? '';
                    if (userId.isNotEmpty) {
                      FirebaseFirestore.instance.collection('users').doc(userId).set({
                        'name': nameController.value.text,
                        'email': email,
                        // Diğer kullanıcı bilgilerini buraya ekleyebilirsiniz
                      }).then((value) {
                        print('Kullanıcı verileri Firestore\'a kaydedildi');
                        // Kayıt işlemi başarılı olduğunda yapılacak işlemler
                        context.go(PatientMainPage.route);
                      }).catchError((error) {
                        print('Firestore\'a kayıt hatası: $error');
                      });
                    }
                  }).catchError((error) {
                    // Hata durumunda yapılacak işlemler
                    if (error.code == 'email-already-in-use') {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Hata'),
                          content: Text('Bu email adresi zaten kullanılıyor.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Tamam'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      print('Kayıt işlemi hatalı: $error');
                    }
                  });
                }
              },
            ),
                SizedBox(height: 20),

                // Giriş sayfasına dön butonu
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      context.go(LoginPage.route);
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Utils.mainThemeColor),
                    ),
                    child: Text('Giriş sayfasına dön'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
