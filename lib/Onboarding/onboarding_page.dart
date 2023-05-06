import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tecbook/Onboarding/card_school.dart';
import 'package:tecbook/Screens/Welcome/welcome_screen.dart';
import 'package:tecbook/constants.dart';

class OnboardinPage extends StatelessWidget {
  OnboardinPage({super.key});

  final data = [
    CardSchoolData(
        title: "Bienvenido a TecBook",
        subtitle:
            "Comunicate con toda la cominidad del Instituto Tecnologico Nacional de México en Celaya",
        image: const AssetImage("assets/onboarding/tecbook.png"),
        backgroundColor: kPrimaryColor,
        titleColor: Colors.white,
        subtitleColor: Colors.white,
        background: LottieBuilder.asset("assets/animation/bg-1.json")),
    CardSchoolData(
        title: "Mantente conectado desde cualquier lugar",
        subtitle:
            "Ya no hay excusas para que te comuniques con tus compañeros de clase o amigos del TECNM en Celaya",
        image: const AssetImage("assets/onboarding/oneworld.png"),
        backgroundColor: Colors.white,
        titleColor: kPrimaryColor,
        subtitleColor: kPrimaryColor,
        background: LottieBuilder.asset('assets/animation/bg-1.json')),
    CardSchoolData(
        title: "Comparte con la comunidad del TECNM en Celaya",
        subtitle:
            "Comparte fotos, videos, tareas con tus compañeros del TECNM en Celaya",
        image: const AssetImage("assets/onboarding/share.png"),
        backgroundColor: kPrimaryColor,
        titleColor: Colors.white,
        subtitleColor: Colors.white,
        background: LottieBuilder.asset('assets/animation/bg-1.json')),
    CardSchoolData(
        title: "Comenzemos",
        subtitle:
            "Antes de unirte a la comunidad de TecBook deberas registrarte, en caso de ya estar registrado solo inicia sesión ",
        image: const AssetImage("assets/onboarding/quiubole.png"),
        backgroundColor: Colors.white,
        titleColor: kPrimaryColor,
        subtitleColor: kPrimaryColor,
        background: LottieBuilder.asset('assets/animation/bg-1.json')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        onFinish: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => const WelcomeScreen())));
        },
        itemBuilder: (int index) {
          return CardSchool(data: data[index]);
        },
      ),
    );
  }
}
