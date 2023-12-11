import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Montserrat extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  const Montserrat({super.key, required this.text, required this.color, required this.fontSize, required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(color: color, fontSize: fontSize/MediaQuery.textScaleFactorOf(context), fontWeight: fontWeight),
    );
  }
}