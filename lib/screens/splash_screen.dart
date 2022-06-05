import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Login-Register/log_in_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const LogInScreen(),
      duration: 5000,
      imageSize: 300,
      imageSrc:
          'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1569843069-work-2-1569843063.png?crop=1xw:1xh;center,top&resize=320%3A%2A',
      text: "ShoeKart",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
      colors: const [
        Colors.red,
        Colors.yellow,
        Colors.white,
      ],
    );
  }
}
