import 'package:bike_online_application/common/component/Button_Login_Register.dart';
import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    // final logger = Logger();
    // logger.d("Height: ${MediaQuery.of(context).size.height}");
    // logger.d("Widht: ${MediaQuery.of(context).size.width}");
    // logger.d("Font Size: ${MediaQuery.of(context).textScaleFactor}");

    return Scaffold(
      backgroundColor: ColorClass.background,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.height15(context),
            vertical: Dimensions.widht15(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: Dimensions.height30(context)),
              child: PoppinText(
                text: "Get your free account",
                fontSize: Dimensions.font28(context),
                weight: FontWeight.bold,
                isBlack: false,
              ),
            ),
            formEmail(context, email),
            formPassword(context, password),
            formPasswords(context, password),
            SizedBox(height: Dimensions.height50(context)),
            ButtonFormat(text: "Register", buttonPressed: () {})
          ],
        ),
      ),
    );
  }

  Widget formEmail(BuildContext context, TextEditingController control) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        jarak(context, "Email"),
        form(
          context,
          TextFormField(
            controller: control,
            style: GoogleFonts.poppins(
                color: ColorClass.white, fontSize: Dimensions.font16(context)),
            decoration: InputDecoration(
              hintText: "youremail@gmail.com",
              hintStyle:
                  GoogleFonts.poppins(color: ColorClass.white.withOpacity(.6)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: Dimensions.widht10(context)),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }

  Widget formPassword(BuildContext context, TextEditingController control) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        jarak(context, "Password"),
        form(
          context,
          TextFormField(
            obscureText: true,
            controller: control,
            style: GoogleFonts.poppins(
                color: ColorClass.white, fontSize: Dimensions.font16(context)),
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle:
                  GoogleFonts.poppins(color: ColorClass.white.withOpacity(.6)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: Dimensions.widht10(context)),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }

  Widget formPasswords(BuildContext context, TextEditingController control) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        jarak(context, "Confirm Password"),
        form(
          context,
          TextFormField(
            obscureText: true,
            controller: control,
            style: GoogleFonts.poppins(
                color: ColorClass.white, fontSize: Dimensions.font16(context)),
            decoration: InputDecoration(
                hintText: "Password",
                hintStyle: GoogleFonts.poppins(
                    color: ColorClass.white.withOpacity(.6)),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Dimensions.widht10(context)),
                border: InputBorder.none),
          ),
        )
      ],
    );
  }

  Widget form(BuildContext context, Widget widget) {
    return Container(
      height: Dimensions.height50(context),
      width: Dimensions.widht360(context),
      decoration: BoxDecoration(
          border: Border.all(color: ColorClass.white),
          borderRadius: BorderRadius.circular(10)),
      child: widget,
    );
  }

  Widget jarak(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimensions.height30(context),
          bottom: Dimensions.height15(context)),
      child: PoppinText(
        text: text,
        fontSize: Dimensions.font16(context),
        weight: FontWeight.normal,
        isBlack: false,
      ),
    );
  }
}
