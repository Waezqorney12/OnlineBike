import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback buttonPressed;
  const GoogleButton({super.key, required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(ColorClass.background),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          minimumSize: MaterialStatePropertyAll(
              Size(Dimensions.widht360(context), Dimensions.height50(context))),
          side: MaterialStatePropertyAll(
            BorderSide(
              color:
                  ColorClass.white.withOpacity(.4), // Set the border color here
            ),
          ),
        ),
        onPressed: buttonPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              child: Padding(
                padding:
                    EdgeInsets.only(right: Dimensions.widht20(context)),
                child: Image.asset(ImageClass.google),
              ),
            ),
            BinaryPoppinText(
              text: "Continue with Google",
              fontSize: Dimensions.font16(context),
              weight: FontWeight.w500,
              isBlack: false,
            )
          ],
        ));
  }
}
