import 'package:ff_55/features/splash/selection_screen.dart';
import 'package:ff_55/routes/app_routes.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static String route = "/onboardingPage";

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardContent(
                    img: demo_data[index].img,
                    desc: demo_data[index].desc,
                  )),
            ),
            Row(
              children: [
                SizedBox(width: 10,),
                ElevatedButton(
                    onPressed: (){
                      Future.delayed(const Duration(), () {
                        GoRouter.of(Keys.mainNav.currentContext!)
                            .go(SelectionScreen.route);});
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        backgroundColor: Utils.mainThemeColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Atla",style: TextStyle(fontSize: 28),),
                    )
                ),
                Spacer(),
                ...List.generate(
                    demo_data.length,
                        (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    )),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 60,
                      width: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          if(_pageIndex==1){
                            Future.delayed(const Duration(), () {
                              GoRouter.of(Keys.mainNav.currentContext!)
                                  .go(SelectionScreen.route);});
                          }
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Utils.mainThemeColor),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        ),
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.only(left: 8),
      height: isActive ? 20 : 12,
      width: 12,
      decoration: BoxDecoration(
          color: isActive? Utils.mainThemeColor:Utils.mainThemeColor.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class Onboard {
  final String img, desc;
  Onboard({required this.img, required this.desc});
}

final List<Onboard> demo_data = [
  Onboard(
      img: "assets/images/HastaYakını_onboarding.png",
      desc:
      "Hasta Yakını Bölümünde hastanızın konumunu görebilir,hasta ile alakalı bilgileri takip edebilir,mesaj atabilir ve hasta yakını kendi için notlar tutabilir"),

  Onboard(
      img: "assets/images/Hasta_onboarding.png",
      desc:
      "Hasta Bölümünde ise hasta olan kişi kendi bilgilerine acil bir durumda ulaşabilir, eğer kaybolursa evine navigasyon bölümünden evine gidebilir , acil bir durumda yakınını arayabilir ve zihin aktivitesini geliştirici hafıza oyunları oynayabilir"),
];

class OnboardContent extends StatelessWidget {
  final String img, desc;
  const OnboardContent({
    super.key,
    required this.img,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            child: Image.asset(
              img,
              fit: BoxFit.cover,
              height: 500,
              width: 450,
            )),
        Container(
            padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Text(
              desc,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )),
        Spacer(),
      ],
    );
  }
}