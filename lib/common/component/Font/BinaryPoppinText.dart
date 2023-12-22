import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BinaryPoppinText extends StatelessWidget {
  final String text;
  final bool isBlack;
  final double fontSize;
  final FontWeight weight;
  TextAlign? aligment;
  BinaryPoppinText (
      {super.key,
      this.aligment,
      this.isBlack = true,
      required this.text,
      required this.fontSize,
      required this.weight});

  @override
  Widget build(BuildContext context) {

    final Color textColor = isBlack == true ? Colors.black : Colors.white;

    return Text(
      textAlign: aligment,
      text,
      style: GoogleFonts.poppins(
          color: textColor,
          fontSize: fontSize / MediaQuery.of(context).textScaleFactor,
          fontWeight: weight),
    );
  }
}
