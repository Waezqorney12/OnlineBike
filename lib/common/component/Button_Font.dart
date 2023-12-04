import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonFont extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final VoidCallback fontPressed;
  const ButtonFont({super.key, required this.textOne, required this.textTwo ,required this.fontPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding:
                  EdgeInsets.symmetric(vertical: Dimensions.height15(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textOne,
                    style: GoogleFonts.poppins(
                        fontSize: Dimensions.font12(context),
                        fontWeight: FontWeight.w500,
                        color: ColorClass.white.withOpacity(.6)),
                  ),
                  SizedBox(width: Dimensions.widht10(context),),
                  GestureDetector(
                    onTap: fontPressed,
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            ColorClass.lightBlue,
                            ColorClass.darkBlue
                          ])
                            .createShader(bounds);
                      },
                      child: PoppinText(text: textTwo, fontSize: Dimensions.font12(context), weight: FontWeight.w500, isBlack: false,)
                    ),
                  )
                ],
              ),
            );
  }
}