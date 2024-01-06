import 'dart:async';

import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    splashScreen(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.blueIcon,
      body: Center(child: Image.asset(ImageClass.splash)),
    );
  }
}
Timer splashScreen(BuildContext context){
  const duration = Duration(seconds: 3);
  return Timer(duration, () => Navigator.pushReplacementNamed(context, '/Login'));
}
