import 'package:ff_55/features/companion/pages/components/notes/notes_home_screen.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class CompanionHomePage extends StatelessWidget {
  const CompanionHomePage
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
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
                  title: Text("Hoşgeldin, Ayşe",style: TextStyle(color: Colors.white, fontSize: 20), ),
                  subtitle: Text("Umarım, güzel bir gün geçirirsin",
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400 ), ),
                ),
              ),
            ),
          ),

          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              crossAxisCount: 2,
              children: <Widget>[
                CardHome(
                  text: "Hasta Bilgileri",
                  icon: Icons.info_sharp,
                  onTap: () {
                   
                  },
                ),
                CardHome(
                  text: "Konumunu Gör",
                  icon: Icons.location_on,
                  onTap: () {},
                ),
                CardHome(
                  text: "Hastalık Bilgilendirme",
                  icon: Icons.notification_important,
                  onTap: () {},
                ),
                CardHome(
                  text: "Notlarım",
                  icon: Icons.note_add,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NotesHomeScreen();
                    }));
                  },
                ),
              ],
            ),
          )
        ],
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

class CardHome extends StatelessWidget {
   const CardHome({ required this.text, required this.icon, required this.onTap,
    Key? key,
  }) : super(key: key);

   
   final String text;
   final IconData icon;
   final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        padding: const EdgeInsets.all(8),
        //color: Colors.grey[300],
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Utils.mainThemeColor,//Utils.secondaryColor,
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            // Text(text1, 
            // style: TextStyle(fontSize: 24, color: Colors.white,), 
            // ),
            Icon(icon, color: Colors.white, size: 70, ),
    
            Text(text, 
            style: TextStyle(fontSize: 20, color: Colors.white,),)
        ]),
 
      ),
    );
  }

}
