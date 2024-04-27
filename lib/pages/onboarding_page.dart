import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:food/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:food/pages/widget/card_planet.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});

  final data = [
    CardPlanetData(
      title: "observe",
      subtitle:
          "The night sky has much to offer to those who seek its mystery.",
      //image: const AssetImage("assets/images/img-1.png"),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.pink,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/images/animations/bg-1.json"),
    ),
    CardPlanetData(
      title: "imagine",
      subtitle: "An endless number of galaxies means endless possibilities.",
      //image: const AssetImage("assets/images/img-2.png"),
      backgroundColor: Colors.white,
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      background: LottieBuilder.asset("assets/images/animations/bg-2.json"),
    ),
    CardPlanetData(
      title: "stargaze",
      subtitle: "The sky dome is a beautiful graveyard of stars.",
      //image: const AssetImage("assets/images/img-3.png"),
      backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
      titleColor: Colors.yellow,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/images/animations/bg-3.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index, double value) {
          return CardPlanet(data: data[index]);
        },
        onFinish: () {
          controller.skipPage();
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => const LoginPage()),
          // );
        },
      ),
    );
  }
}
