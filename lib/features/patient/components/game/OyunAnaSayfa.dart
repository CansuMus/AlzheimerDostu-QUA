
import 'package:dialogs/dialogs/message_dialog.dart';


import 'package:ff_55/features/patient/components/game/seviye1.dart';
import 'package:ff_55/features/patient/components/game/seviye2.dart';
import 'package:ff_55/features/patient/components/game/seviye3.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:nice_buttons/nice_buttons.dart';




class OyunAnaEkrani extends StatefulWidget {
  const OyunAnaEkrani({Key? key}) : super(key: key);

  @override
  State<OyunAnaEkrani> createState() => _OyunAnaEkraniState();
}

class _OyunAnaEkraniState extends State<OyunAnaEkrani> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
    final shadow = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 2),
    );
    return  Scaffold(

      body: SingleChildScrollView(
        child: Column(
      
          children: [
      
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: 200,
                color: Utils.mainThemeColor,
                child: Center(
                  child: ListTile(
                    leading: IconButton(icon: Icon(Icons.menu, color: Colors.white, size: 26,), onPressed: () {
                    },),
                    title: Text("Ayşe,Şu Anda Oyun Seviyesi Seçme Sayfasındasın",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white, fontSize: 16), ),
                    subtitle: Text("",
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400 ), ),
                  ),
                ),
              ),
            ),
      
      
            SizedBox(
              height: 50,
            ),
            NiceButtons(
              height: 80,
              width: 300,
              borderColor: Utils.mainThemeColor,
              startColor: Utils.mainThemeColor,
              endColor: Utils.secondaryColor,
              stretch: false,
              gradientOrientation: GradientOrientation.Horizontal,
              onTap: (finish) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home3()));
              },
              child: Text(
                'Başlangıç Seviye Alzheimer',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            NiceButtons(
              height: 80,
              width: 300,
              borderColor: Utils.mainThemeColor,
              startColor: Utils.mainThemeColor,
              endColor: Utils.secondaryColor,
              stretch: false,
              gradientOrientation: GradientOrientation.Horizontal,
              onTap: (finish) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home2()));
              },
              child: Text(
                'Orta Seviye Alzheimer',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
      
            SizedBox(
              height: 50,
            ),
            NiceButtons(
              height: 80,
              width: 300,
              borderColor: Utils.mainThemeColor,
              startColor: Utils.mainThemeColor,
              endColor: Utils.secondaryColor,
              stretch: false,
              gradientOrientation: GradientOrientation.Horizontal,
              onTap: (finish) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              },
              child: Text(
                'İleri Seviye Alzheimer',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            NiceButtons(
              height: 80,
              width: 300,
              borderColor: Utils.mainThemeColor,
              startColor: Utils.mainThemeColor,
              endColor: Utils.secondaryColor,
              stretch: false,
              gradientOrientation: GradientOrientation.Horizontal,
              onTap: (finish) {
                MessageDialog messageDialog = MessageDialog(
                    dialogBackgroundColor: Colors.white,
                    buttonOkColor: Utils.mainThemeColor,
                    title: 'Bilgi',
                    titleColor: Colors.black,
                    message: 'Hafıza Oyununda Seviye Seçimi Hastalığın Evresine Göre Yapılmaktadır.Başlangıç evre hastalar için hafıza oyunu 20 görsel,Orta evre hastalar için 16 görsel ve İleri seviye hastalar için 10 görsel üzerinden eşleştirme yapmaları beklenmektedir.Tamam diyerek hastalık evresine göre oyun seviyesi seçebilirsiniz. ',
                    messageColor: Colors.black,
                    buttonOkText: 'Tamam',
                    dialogRadius: 15.0,
                    buttonRadius: 18.0,
                    iconButtonOk: Icon(Icons.one_k));
                messageDialog.show(context, barrierColor: Colors.white);
      
              },
              child: Text(
                'Bilgilendirme',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
      
      
          ],
        ),
      ),
    );



  }
}

class CustomClipPath extends CustomClipper<Path>{

  @override
  Path getClip(size) {
    double width = size.width;
    double height = size.height;

    final path = Path();
    path.lineTo(0, height/2);  //2. point
    path.quadraticBezierTo(
      width * 0.5, // 3.point
      height ,  // 3.point
      width, //4. point
      height/2, //4. point
    );

    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}




