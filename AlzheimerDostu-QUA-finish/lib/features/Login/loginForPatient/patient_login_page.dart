import 'package:ff_55/features/patient/pages/patient_main_page.dart';
import 'package:ff_55/services/firebase_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../messages/BildirimGönder.dart';
import '../../../styles/colors/colors.dart';
import '../LoginForCompanion/login_button.dart';
import '../LoginForCompanion/login_textfield.dart';


class PatientLoginPage extends StatefulWidget {
  static String route = "/patientLogin"; 
  const PatientLoginPage({super.key});

  @override
  State<PatientLoginPage> createState() => _PatientLoginPageState();
}

class _PatientLoginPageState extends State<PatientLoginPage> {
   TextEditingController pwdController = TextEditingController();


  bool validateFormFields(){
    return (pwdController.text.isNotEmpty && pwdController.value.text.length >= 6);
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Utils.mainThemeColor),
        backgroundColor: Colors.transparent,
        title: const Icon(Icons.medical_information_rounded, color: Utils.mainThemeColor, size: 40),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginTextField(
                          icon: Icons.password,
                          hintText: "Şifre Girin",
                          isPasswordField: true,
                          controller: pwdController,
                          onChanged: (text) {
                            setState(() {});
                          }),
                
                          SizedBox(height: 20,),


            
             LoginButton(
                    label: 'Giriş',
                     enabled: validateFormFields(),
                    onTap: () async{
                      String code = pwdController.value.text;
                      //FirebaseFunctions.patientCodeVerification(code, context.go(PatientMainPage.route));
                      // try{
                      // if(await FirebaseFunctions.checkCode(code)){
                      //   context.go(PatientMainPage.route);
                      // }
                      // else
                      //   debugPrint("Error");
                      //   } catch(e){
                      //     debugPrint(e.toString());
                      //   }


                      bool isValid = await FirebaseFunctions.checkCode(code);
                      if (isValid) {
                        // the code is valid, navigate to the next page
                        context.go(PatientMainPage.route);
                        
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>HastayaBildirim()));
                      } else {
                        // the code is invalid, maybe show an error message
                        print('Invalid code');
                       showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Hata'),
                              content: Text('Doğru şifre giriniz'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Tamam'),
                                ),
                              ],
                            ),
                          );
                      }

                    } 
                    )
          ],
        ),
      ),
    );
  }
}