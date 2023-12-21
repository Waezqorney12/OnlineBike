
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PoppinText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  final Color color;
  const PoppinText (
      {super.key,
      required this.text,
      required this.fontSize,
      required this.weight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: color,
          fontSize: fontSize / MediaQuery.of(context).textScaleFactor,
          fontWeight: weight),
    );
  }
}
