import 'package:ff_55/features/Login/login_button.dart';
import 'package:ff_55/features/Login/login_textfield.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class AccountRegistrationPage extends StatefulWidget {
  const AccountRegistrationPage({super.key});
  static String route = "/accountRegistration";

  @override
  State<AccountRegistrationPage> createState() => _AccountRegistrationPageState();
}

class _AccountRegistrationPageState extends State<AccountRegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
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
            title: const Icon(Icons.medical_information_rounded,
                color: Utils.mainThemeColor, size: 40),
            centerTitle: true),

        body: Container(
            padding: const EdgeInsets.all(30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    // title
                    Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        child: Text('Create New Account',
                            style: TextStyle(
                                color: Utils.mainThemeColor, fontSize: 20))),

                    

                    // email field
                    LoginTextField(
                        icon: Icons.email,
                        hintText: "E-Posta Girin",
                        isPasswordField: false,
                        controller: emailController,
                        onChanged: (text) {
                          setState(() {});
                        }),

                        SizedBox(height: 20,),

                    // password field
                    LoginTextField(
                        icon: Icons.lock,
                        hintText: "Şifre Girin",
                        isPasswordField: true,
                        controller: passwordController,
                        onChanged: (text) {
                          setState(() {});
                        }),

                        SizedBox(height: 20,),

                    // password confirmation field
                    LoginTextField(
                        icon: Icons.lock,
                        hintText: "Şifre Tekrar Girin",
                        isPasswordField: true,
                        controller: confirmPasswordController,
                        onChanged: (text) {
                          setState(() {});
                        }),
                  ])),

              LoginButton(
                  label: 'Kayıt',
                  enabled: false, //validateFormFields(),
                  onTap: (){
                    // String username = emailController.value.text;
                    // String pwd = passwordController.value.text;

                    // bool accountCreated =
                    //     await loginService.createUserWithEmailAndPassword(username, pwd);

                    // if (accountCreated) {
                    //   Navigator.of(context).pop();
                    // }
                  })
            ])));
  }
}