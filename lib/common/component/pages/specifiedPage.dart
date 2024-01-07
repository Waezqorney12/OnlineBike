// ignore_for_file: file_names

import 'package:bike_online_application/common/component/PathAppBar.dart';
import 'package:bike_online_application/common/component/Border_Form.dart';
import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecifiedPage extends StatelessWidget {
  final String path;
  final String tittle;
  final TextEditingController controller;
  final Widget widget;
  final String subTittle;
  final String hintText;
  const SpecifiedPage(
      {super.key,
      required this.path,
      required this.tittle,
      required this.subTittle,
      required this.controller,
      required this.widget,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(path: path, text: tittle),
      backgroundColor: ColorClass.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.widht15(context),
              vertical: Dimensions.height20(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: Dimensions.height15(context)),
                child: BinaryPoppinText(
                  text: subTittle,
                  fontSize: Dimensions.font16(context),
                  weight: FontWeight.normal,
                  isBlack: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: Dimensions.height250(context),
                ),
                child: BorderForm(
                  widget: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: Dimensions.widht15(context)),
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.poppins(
                              color: ColorClass.white.withOpacity(.6),
                              fontWeight: FontWeight.w500),
                          hintText: hintText),
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: Dimensions.font16(context))),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: Dimensions.height250(context)),
                  child: widget),
            ],
          ),
        ),
      ),
    );
  }
}
