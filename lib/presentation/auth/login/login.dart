import 'package:bike_online_application/bloc/auth/login/auth_bloc.dart';
import 'package:bike_online_application/common/component/Font/MontserratText.dart';
import 'package:bike_online_application/common/component/Border_Form.dart';
import 'package:bike_online_application/common/component/Button_Font.dart';
import 'package:bike_online_application/common/component/Button_Google.dart';
import 'package:bike_online_application/common/component/Button_Login_Register.dart';
import 'package:bike_online_application/common/component/Diveder.dart';
import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:bike_online_application/presentation/auth/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.background,
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    height: Dimensions.height200(context),
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(ImageClass.imageLogin, fit: BoxFit.cover,),
                  ),
                ),
                Center(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: Dimensions.height110(context)),
                    child: Container(
                      height: Dimensions.height100(context),
                      width: Dimensions.widht100(context),
                      decoration: BoxDecoration(
                          color: ColorClass.white, shape: BoxShape.circle),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          fontLogo(text: "Rack"),
                          fontLogo(text: "And", isSize: false),
                          fontLogo(text: "Bold")
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.widht15(context)),
              child: Column(
                children: [
                  SizedBox(
                    height: Dimensions.height20(context),
                  ),
                  formEmail(context, emailController),
                  formPassword(context, passwordController),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height15(context),
                            right: Dimensions.widht10(context),
                            bottom: Dimensions.height30(context)),
                        child: ShaderMask(
                          shaderCallback: (bounds) {
                            return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  ColorClass.lightBlue,
                                  ColorClass.darkBlue
                                ]).createShader(bounds);
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/ForgotPassword');
                            },
                            child: BinaryPoppinText(
                              text: "Forgot Password?",
                              fontSize: Dimensions.font14(context),
                              weight: FontWeight.normal,
                              isBlack: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ButtonFormat(
                      text: "Login",
                      buttonPressed: () async {
                        context.read<AuthBloc>().add(AuthEmailPasswordEvent(
                            context: context,
                            email: emailController.text.trim(),
                            password: passwordController.text.trim()));
                      }),
                  const DivederOr(),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return GoogleButton(buttonPressed: () async {
                        context.read<AuthBloc>().add(AuthGoogleEvent(context: context));
                      });
                    },
                  ),
                  ButtonFont(
                      textOne: "Already have account?",
                      textTwo: "Sign Up",
                      fontPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ));
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Montserrat fontLogo({required String text, bool isSize = true}) {
    final double size = isSize == true
        ? Dimensions.font18(context)
        : Dimensions.font12(context);
    final FontWeight fontWeight =
        isSize == true ? FontWeight.bold : FontWeight.w500;

    return Montserrat(
        text: text,
        color: ColorClass.darkGreen,
        fontSize: size,
        fontWeight: fontWeight);
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

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, 100);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
