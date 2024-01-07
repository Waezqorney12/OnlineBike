import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:flutter/material.dart';

class NormalAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String text;
  const NormalAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorClass.navDown,
      title: BinaryPoppinText(
              text: text,
              fontSize: Dimensions.font20(context),
              weight: FontWeight.bold,
              isBlack: false,
            ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}