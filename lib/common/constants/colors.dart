import 'package:flutter/material.dart';

class ColorClass {
  static Color backgroundIcon = const Color(0xFF3A3E9A);
  static Color background = const Color(0xFF242C3B);
  static Color backgroundAppbar = const Color(0xFF181C24).withOpacity(.4);
  static Color white = const Color(0xFFBBC7DE);
  static Color white2 = const Color(0xFFC5BEDB);
  static Color blueStatus = const Color(0xFF98A2F6);
  static Color grey = const Color(0xFF777777);

  // Mix Color
  static Color lightBlue = const Color(0xFF37B6E9);
  static Color darkBlue = const Color(0xFF4B4CED);
  static Color darkGreen = const Color(0xFF2F7591);
  static Color yellowCustom = const Color.fromARGB(255, 238, 220, 60);

  // Bottom Navigation Bar
  static Color navigations = const Color(0xFF2D3662);
  
  static Color navUp = const Color(0xFF363E51);
  static Color navDown = const Color(0xFF181C24);
  static Gradient getBlueGradient() {
    return LinearGradient(
      colors: [lightBlue, darkBlue],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  // Box Personal Information
  static Color boxUp = const Color(0xFF353F54);
  static Color boxDown = const Color(0xFF222834).withOpacity(.0);

  // Credit Card
  //static Color creditCard = const Color(0xFF1B16FF);
  static Color logoCard1 = const Color(0xFFEB001B);
  static Color logoCard2 = const Color(0xFFF79E1B);
  static Color effectCard = const Color(0xFF4A4A4A);
  //static Color effectCard = const Color (0xFFFEFEFE);

  // Icon
  static Color blueIcon = const Color(0xFF5699FF);
}
