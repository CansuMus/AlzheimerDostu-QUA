import 'package:ff_55/features/splash/selection_screen.dart';
import 'package:ff_55/routes/app_routes.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});
  static String route = "/startPage";

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.mainThemeColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(child: Image.asset("assets/images/logo.png")),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Alzheimer Dostu’na Hoşgeldiniz",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(child: Image.asset("assets/images/start_foto.png")),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 45),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Utils.secondaryColor),
                minimumSize: MaterialStateProperty.all(Size(250, 50)),
              ),
              child: Text(
                "Başla",
                style: TextStyle(fontSize: 26),
              ),
              onPressed: () {
                 Future.delayed(const Duration(), () {
                  GoRouter.of(Keys.mainNav.currentContext!)
                 .go(SelectionScreen.route);});
              },
            ),
          )
        ],
      ),
    );
  }
}
