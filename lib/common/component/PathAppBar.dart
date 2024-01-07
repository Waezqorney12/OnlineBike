import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final String path;
  const MyAppBar({super.key, required this.path, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorClass.navDown,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(Dimensions.height50(context)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height5(context),
                  horizontal: Dimensions.widht10(context)),
              child: GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, path),
                child: Container(
                  width: Dimensions.widht40(context),
                  height: Dimensions.height40(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: ColorClass.getBlueGradient()),
                  child: Icon(
                    size: Dimensions.font20(context),
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.widht10(context),
            ),
            BinaryPoppinText(
              text: text,
              fontSize: Dimensions.font20(context),
              weight: FontWeight.bold,
              isBlack: false,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
