import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BinaryPoppinText extends StatelessWidget {
  final String text;
  final bool isBlack;
  final double fontSize;
  final FontWeight weight;
  const BinaryPoppinText (
      {super.key,
      this.isBlack = true,
      required this.text,
      required this.fontSize,
      required this.weight});

  @override
  Widget build(BuildContext context) {

    final Color textColor = isBlack == true ? Colors.black : Colors.white;

    return Text(
      text,
      style: GoogleFonts.poppins(
          color: textColor,
          fontSize: fontSize / MediaQuery.of(context).textScaleFactor,
          fontWeight: weight),
    );
  }
}
