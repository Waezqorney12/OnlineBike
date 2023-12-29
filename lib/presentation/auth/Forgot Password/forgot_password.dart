import 'package:bike_online_application/bloc/auth/forgotPassword/forgot_password_bloc.dart';
import 'package:bike_online_application/common/component/Border_Form.dart';
import 'package:bike_online_application/common/component/Button_Login_Register.dart';
import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/repository/firebase/auth/Forgot%20Password/ForgotPasswordAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController forgotController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    forgotController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorClass.navDown,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(Dimensions.height20(context)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height10(context),
                  horizontal: Dimensions.widht10(context)),
              child: GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, '/Login'),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: ColorClass.getBlueGradient()),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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
                  text: "Email",
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
                      controller: forgotController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: Dimensions.widht15(context)),
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.poppins(
                              color: ColorClass.white.withOpacity(.6),
                              fontWeight: FontWeight.w500),
                          hintText: "youremail@gmail.com"),
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: Dimensions.font16(context))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Dimensions.height250(context)),
                child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ButtonFormat(
                      text: "Send Email Verification",
                      buttonPressed: () {
                        context.read<ForgotPasswordBloc>().add(
                          ForgotPasswordSubmitEvent(context: context,email: forgotController.text.trim())
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
