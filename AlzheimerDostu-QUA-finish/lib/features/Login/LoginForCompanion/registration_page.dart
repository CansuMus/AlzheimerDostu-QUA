import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dialogs/dialogs/message_dialog.dart';
import 'package:ff_55/features/Login/LoginForCompanion/login_button.dart';

import 'package:ff_55/features/Login/LoginForCompanion/login_page_2.dart';
import 'package:ff_55/features/Login/LoginForCompanion/custom_login_textfield.dart';
import 'package:ff_55/features/Login/LoginForCompanion/login_page.dart';

import 'package:ff_55/features/companion/pages/companion_main_page.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../services/firebase_functions.dart';
import 'login_textfield.dart';

class AccountCompanionRegistrationPage extends StatefulWidget {
  AccountCompanionRegistrationPage({Key? key}) : super(key: key);
  static String route = "/accountRegistration";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  State<AccountCompanionRegistrationPage> createState() => _AccountCompanionRegistrationPageState();
}

class _AccountCompanionRegistrationPageState extends State<AccountCompanionRegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController patientNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    patientNameController.dispose();
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


                LoginTextField(
                  icon: Icons.person,
                  hintText: "Hastanızın ismini giriniz",
                  isPasswordField: false,
                  controller: patientNameController,
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

                            String code = FirebaseFunctions.generateRandomCode();
                            MessageDialog messageDialog = MessageDialog(
                                dialogBackgroundColor: Colors.white,
                                buttonOkColor: Utils.mainThemeColor,
                                title: 'Hastanız İçin Şifreli Giriş Tanımlanmıştır',
                                titleColor: Colors.black,
                                message: 'Hastanızın Geçerli Şifresi:${code} ',
                                messageColor: Colors.black,
                                buttonOkText: 'Tamam',
                                dialogRadius: 15.0,
                                buttonRadius: 18.0,
                                iconButtonOk: Icon(Icons.one_k));
                            messageDialog.show(context, barrierColor: Colors.white);
                        // Firebase Auth kaydı başarılı olduğunda yapılacak işlemler

                        // Kullanıcının Firestore'da kaydedilmesi
                        String userId = userCredential.user?.uid ?? '';
                        if (userId.isNotEmpty) {
                          FirebaseFirestore.instance.collection('users').doc(userId).set({
                            'name': nameController.value.text,
                            'hy_email': email,
                            'friendName': patientNameController.value.text,
                            'code': code,

                            // Diğer kullanıcı bilgilerini buraya ekleyebilirsiniz
                          }).then((value) {
                            print('Kullanıcı verileri Firestore\'a kaydedildi');
                            Duration(seconds: 2000);

                            // Kayıt işlemi başarılı olduğunda yapılacak işlemler
                            context.go(LoginScreen.route);
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
                      context.go(LoginScreen.route);//LoginPageForCompanion.route);
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
