import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_55/features/Login/LoginForCompanion/custom_login_textfield.dart';
import 'package:ff_55/features/Login/LoginForCompanion/registration_page.dart';
import 'package:ff_55/features/companion/pages/companion_main_page.dart';
import 'package:ff_55/features/patient/pages/patient_main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared.dart';
import '../../../styles/colors/colors.dart';
import '../../../widgets/constant.dart';
import '../../../widgets/primarybutton.dart';
import '../../../widgets/secondarybutton.dart';
import '../../splash/selection_screen.dart';


class LoginScreen extends StatefulWidget {
  static String route = "/loginScreenPage";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordShown = true;
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  _onSubmit() async {
    _formKey.currentState!.save();
    try {
      setState(() {
        isLoading = true;
      });
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: _formData['email'].toString(),
          password: _formData['password'].toString());
      if (userCredential.user != null) {
        setState(() {
          isLoading = false;
        });

         goTo(context, CompanionMainPage());
        // FirebaseFirestore.instance
        //     .collection('users')
        //     .doc(userCredential.user!.uid)
        //     .get()
        //     .then((value) {

        //       goTo(context, CompanionMainPage());
        //   // if (value['type'] == 'hasta_yakını') {
        //   //   print(value['type']);
        //   //   MySharedPrefference.saveUserType('hasta_yakını');
        //   //   goTo(context, CompanionMainPage());
          
        //   // } else {
        //   //   MySharedPrefference.saveUserType('hasta');

        //   //   goTo(context, PatientMainPage());
        //   // }
        // });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        dialogueBox(context, 'No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        dialogueBox(context, 'Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }
    print(_formData['email']);
    print(_formData['password']);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                isLoading
                    ? progressIndicator(context)
                    : SingleChildScrollView(
                  child: Column(
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
                        'Welcome To',
                        style: GoogleFonts.roboto(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Alzheimer Dostu",
                        style: GoogleFonts.roboto(
                          color: Utils.mainThemeColor,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomTextField(
                                hintText: 'Kullanıcı Emailini Giriniz',
                                textInputAction: TextInputAction.next,
                                keyboardtype: TextInputType.emailAddress,
                                prefix: Icon(Icons.person),
                                onsave: (email) {
                                  _formData['email'] = email ?? "";
                                },
                                validate: (email) {
                                  if (email!.isEmpty ||
                                      email.length < 3 ||
                                      !email.contains("@")) {
                                    return 'enter correct email';
                                  }
                                },
                              ),
                              CustomTextField(
                                hintText: 'Şifrenizi Giriniz',
                                isPassword: isPasswordShown,
                                prefix: Icon(Icons.vpn_key_rounded),
                                validate: (password) {
                                  if (password!.isEmpty ||
                                      password.length < 7) {
                                    return 'enter correct password';
                                  }
                                  return null;
                                },
                                onsave: (password) {
                                  _formData['password'] = password ?? "";
                                },
                                suffix: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isPasswordShown = !isPasswordShown;
                                      });
                                    },
                                    icon: isPasswordShown
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility)),
                              ),
                              PrimaryButton(
                                  title: 'Giriş',
                                  onPressed: () {
                                    // progressIndicator(context);
                                    if (_formKey.currentState!.validate()) {
                                      _onSubmit();
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),

                      // SecondaryButton(
                      //     title: 'Hasta Olarak Kayıt Ol',
                      //     onPressed: () {
                      //       goTo(context, AccountRegistrationPage());
                      //     }),
                      SecondaryButton(
                          title: //'Hasta Bakıcısı Olarak Kayıt Ol',
                          "Kayıt ol",
                          onPressed: () {
                            goTo(context, AccountCompanionRegistrationPage());
                          }),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}