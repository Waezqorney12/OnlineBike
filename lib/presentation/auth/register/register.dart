import 'package:bike_online_application/bloc/auth/register/register_bloc.dart';
import 'package:bike_online_application/common/component/Border_Form.dart';
import 'package:bike_online_application/common/component/Button_Font.dart';
import 'package:bike_online_application/common/component/Button_Google.dart';
import 'package:bike_online_application/common/component/Button_Login_Register.dart';
import 'package:bike_online_application/common/component/Diveder.dart';
import 'package:bike_online_application/common/component/Font/MontserratText.dart';
import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Logger logger = Logger();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.background,
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.widht15(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BinaryPoppinText(
                  text: "Get your account",
                  fontSize: Dimensions.font28(context),
                  weight: FontWeight.bold,
                  isBlack: false,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: Dimensions.height30(context)),
                  child: Montserrat(
                    color: ColorClass.white.withOpacity(.6),
                    text: "Create yout account for free without tax",
                    fontSize: Dimensions.font14(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                formEmail(context, email),
                formPassword(context, password),
                formPasswords(context, confirm),
                SizedBox(height: Dimensions.height50(context)),
                BlocConsumer<RegisterBloc, RegisterState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ButtonFormat(
                        text: "Register",
                        buttonPressed: () async {
                          context.read<RegisterBloc>().add(
                              RegisterEmailSubmitEvent(
                                  email: email.text.trim(),
                                  password: password.text.trim(),
                                  confirmation: confirm.text.trim(),
                                  context: context));
                        });
                  },
                ),
                const DivederOr(),
                BlocConsumer<RegisterBloc, RegisterState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return GoogleButton(buttonPressed: () async {
                      context.read<RegisterBloc>().add(RegisterGoogleSubmitEvent(context: context));
                    });
                  },
                ),
                ButtonFont(
                    textOne: "Already have account?",
                    textTwo: "Sign In",
                    fontPressed: () {
                      Navigator.pushReplacementNamed(context, '/Login');
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formEmail(BuildContext context, TextEditingController control) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        jarak(context, "Email"),
        BorderForm(
          widget: TextFormField(
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
        BorderForm(
          widget: TextFormField(
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
        BorderForm(
          widget: TextFormField(
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

  Widget jarak(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimensions.height30(context),
          bottom: Dimensions.height15(context)),
      child: BinaryPoppinText(
        text: text,
        fontSize: Dimensions.font16(context),
        weight: FontWeight.normal,
        isBlack: false,
      ),
    );
  }
}
