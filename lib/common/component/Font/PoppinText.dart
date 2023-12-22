
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PoppinText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  final Color color;
  TextAlign? aligment;
  PoppinText (
      {super.key,
      required this.text,
      required this.fontSize,
      required this.weight,
      required this.color,
      this.aligment});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: aligment,
      text,
      style: GoogleFonts.poppins(
          color: color,
          fontSize: fontSize / MediaQuery.of(context).textScaleFactor,
          fontWeight: weight),
    );
  }
}
