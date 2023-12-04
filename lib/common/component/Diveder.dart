import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DivederOr extends StatelessWidget {
  const DivederOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding:
                  EdgeInsets.symmetric(vertical: Dimensions.height20(context)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 150,
                    color: ColorClass.grey,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.widht15(context)),
                      child: Text(
                        "OR",
                        style: GoogleFonts.poppins(
                            color: ColorClass.grey,
                            fontSize: Dimensions.font12(context),
                            fontWeight: FontWeight.w500),
                      )),
                  Container(
                    height: 1,
                    width: 150,
                    color: ColorClass.grey,
                  ),
                ],
              ),
            );
  }
}