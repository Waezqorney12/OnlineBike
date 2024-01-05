import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorClass.blueIcon,
        body: Center(child: Image.asset(ImageClass.splash)));
  }
}
