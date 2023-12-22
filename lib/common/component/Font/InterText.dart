import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InterFont extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  Color? colors;
  InterFont(
      {super.key,
      this.colors = Colors.black,
      required this.text,
      required this.fontSize,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: colors,
      ),
    );
  }
}
