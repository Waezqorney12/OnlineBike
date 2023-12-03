import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    logger.d("Height: ${MediaQuery.of(context).size.height}");
    logger.d("Widht: ${MediaQuery.of(context).size.width}");
    logger.d("Font Size: ${MediaQuery.of(context).textScaleFactor}");

    return Scaffold(
      backgroundColor: ColorClass.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorClass.backgroundAppbar,
        title: Row(
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios)),
            SizedBox(width: Dimensions.widht15(context),),
            PoppinText(text: "Register", fontSize: Dimensions.font20(context), weight: FontWeight.bold, isBlack: false)
          ],
        )
        
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.height15(context), vertical: Dimensions.widht15(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: Dimensions.height30(context)),
              child: PoppinText(
                text: "Get your free account",
                fontSize: Dimensions.font28(context),
                weight: FontWeight.bold,
                isBlack: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Dimensions.height30(context)),
              child: PoppinText(
                text: "Email",
                fontSize: Dimensions.font16(context),
                weight: FontWeight.normal,
                isBlack: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
