import 'package:ff_55/features/companion/pages/components/general_info_alz/card_info.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class GeneralInfoAlz extends StatelessWidget {
  const GeneralInfoAlz
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: 200,
                color: Utils.mainThemeColor,
                child:  const Center(
                  child: ListTile(
                    title: Center(child: Text("Alzhemier Hastalığı Hakkında\n \t\t\t\t\t Genel Bilgilendirme ",style: TextStyle(color: Colors.white, fontSize: 25), )),
                  ),
                  ),
                ),
              ),
              const CardInfo(
                 title: 'Alzheimer Nedir?',
                 text: 'Alzheimer, yaygın görülen bir demans türü olup beyin hücrelerinin yok olmasına neden olan ilerleyici bir nörolojik hastalıktır.',
              ),
              const SizedBox(height: 20,),
              const CardInfo(
                title: "Alzheimer hastalığının sebebi nedir?",
                text: "Alzheimer, beyindeki sinir hücrelerinde normal olmayan protein birikmesine bağlı olarak gelişir. Beta amiloid olarak tanımlanan bu proteinler zaman içinde artarak beyin dokusundan atılamaz hâle gelir. Beynin normal fonksiyonlarını yerine getirmesi için sinir hücrelerinin birbiri ile bağlantı kurması gerekir."
              ),
              const SizedBox(height: 20,),
              const CardInfo(
                title: "Alzheimer hastalığı nasıl başlar?",
                text: "Hastalığın en önemli ve ilk bulgusu unutkanlıktır. Alzheimer hastası yakın geçmişteki bilgi, kişi ve olayları unutur. Hastalık ilerledikçe kişi daha sık unutmaya başlar ve bu bilgileri hatırlayamaz. Unutkanlık, hastalığın ilk dönemlerinde basit unutkanlıklar olarak başlar."
              ),
              const SizedBox(height: 20,),
              const CardInfo(
                title: "Alzheimer Türleri Nelerdir?",
                text: "Alzheimer türleri, bu hastalığının kendi içerisinde ayrıldığı türlerdir. Bu türler, erken, geç ve ailesel olarak üç bölümden oluşmaktadır;\nErken başlayan Alzheimer: Erken başlayan Alzheimer türü, bu hastalığın nadir bir formudur ve 65 yaşından önce başlar.\nGeç başlayan Alzheimer: Alzheimer hastalarının %90’a yakınında görülür, 65 yaşından sonra başlar.\nAilesel Alzheimer Hastalığı: Alzheimer’ın tamamen genetik olan bir formudur. En azından ailenin iki jenerasyonunda vardır.  "
              ),
              const SizedBox(height: 20,),
              const CardInfo(
                title: "Alzhemir evreleri?",
                text: "Evre 1: Dışarıdan normal (Klinik öncesi)\nEvre 2: Çok hafif bozukluk.\nEvre 3: Hafif bozukluk.\nEvre 4: Orta dereceli bozukluk.\nEvre 5: Orta ciddi bozukluk.\nEvre 6: Ciddi bozukluk.\nEvre 7: Çok ciddi bozukluk."
              ),
              const SizedBox(height: 20,),
              const CardInfo(
                title: "Alzheimer  evreleri kaç yıl sürer?",
                text: "Erken Evre: Tani konmasından 20 yıl hatta daha uzun bir süre önce beyinde nörodejenerasyon başlamış olabilir. Orta Evre: Genelde 2-10 yıl sürer. İleri Evre: 1-5 yıl sürebilir."
              ),
              const SizedBox(height: 20,),
              const CardInfo(
                title: "Alzheimer hasta yakınları nelere dikkat etmeli?",
                text: "1.	Empati kurmaya çalışın!\n2.	Sabırlı olun!\n3.	Anlayışlı olun ve tartışmayın!\n4.	Konuştuğu konunun bütünlüğünü bozmayın!\n5.	Müzik dinletin.\n6.	Hastanızın ilaçlarını kendi başına almasına izin vermeyin!\n7.	Hastalarınızın yanında huzurevi ihtimalinden söz etmeyin!\n"
              ),
              const SizedBox(height: 20,),
              const CardInfo(
                title: "Alzheimer hastaları için yemek hazırlamak",
                text: "•	Aşırı yağlı, şekerli gıdalardan ve aşırı tuz kullanımından uzak durulmalı\n•	Çorba, meyve suyu, ayran, süt, hoşaf, ıhlamur gibi sıvı veya püre, muhallebi gibi yarı sıvı gıdalar tercih edebilirsiniz.•	Ara öğünlerde küçük dilimler halinde taze veya kurutulmuş sebze ve meyve sunulmalı\n"
              ),
          ],
        ),
      ),
    );
  }
}


class CustomClipPath extends CustomClipper<Path> {
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