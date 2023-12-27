import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:flutter/material.dart';

class ButtonFormat extends StatelessWidget {
  final String text;
  final VoidCallback buttonPressed;
  const ButtonFormat({super.key, required this.text, required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonPressed,
      child: Container(
        width: Dimensions.widht360(context),
        height: Dimensions.height50(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: ColorClass.getBlueGradient()
        ),
        child:  Center(
                  child:  BinaryPoppinText(text: text, fontSize: 16, weight: FontWeight.bold,isBlack: false,)),
      ),
    );
  }
}


// ElevatedButton(
//               style: ButtonStyle(
                
//                   minimumSize: MaterialStatePropertyAll<Size>(Size(
//                       Dimensions.widht360(context),
//                       Dimensions.height50(context))),
//                   shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10))),
//                   backgroundColor: MaterialStatePropertyAll(ColorClass.white)),
//               onPressed: buttonPressed,
//               child: Center(
//                   child:  BinaryPoppinText(text: text, fontSize: 16, weight: FontWeight.bold, isBlack: true,)),
//             );