import 'package:bike_online_application/common/component/Font/MontserratText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:flutter/material.dart';

class ShowDialog {
  Future<void> warningDialogs(
    BuildContext context,
    String text,
  ) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: Dimensions.minHeight50(context),
                right: 0,
                left: 0,
                child: Container(
                  height: Dimensions.height100(context),
                  width: Dimensions.widht100(context),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorClass.yellowCustom,
                  ),
                  child: Icon(
                    Icons.warning,
                    color: ColorClass.white,
                    size: 70,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.height50(context)),
              child: SizedBox(
                height: Dimensions.height100(context),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Montserrat(
                      text: "Warning",
                      fontSize: Dimensions.font16(context),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    SizedBox(height: Dimensions.height10(context),),
                    Montserrat(
                        text: text,
                        fontSize: Dimensions.font16(context),
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    
                  ],
                ),
              ),
            )
          ],
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: Dimensions.height20(context)),
              child: InkWell(
                highlightColor: ColorClass.darkBlue.withOpacity(.4),
                splashColor: ColorClass.background.withOpacity(.6),
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20),
                    color: Colors.blue,
                  ),
                  child: Container(
                      height: Dimensions.height45(context),
                      width: Dimensions.widht100(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent),
                      child: Center(
                          child: Montserrat(
                        text: "Okay",
                        fontSize: Dimensions.font14(context),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> errorDialogs(
    BuildContext context,
    String text,
  ) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: Dimensions.minHeight50(context),
                right: 0,
                left: 0,
                child: Container(
                  height: Dimensions.height100(context),
                  width: Dimensions.widht100(context),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Icon(
                    Icons.clear,
                    color: ColorClass.white,
                    size: 70,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.height50(context)),
              child: SizedBox(
                height: Dimensions.height100(context),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Montserrat(
                      text: "Failed",
                      fontSize: Dimensions.font16(context),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    SizedBox(height: Dimensions.height10(context),),
                    Montserrat(
                        text: text,
                        fontSize: Dimensions.font16(context),
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    
                  ],
                ),
              ),
            )
          ],
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: Dimensions.height20(context)),
              child: InkWell(
                highlightColor: ColorClass.darkBlue.withOpacity(.4),
                splashColor: ColorClass.background.withOpacity(.6),
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20),
                    color: Colors.blue,
                  ),
                  child: Container(
                      height: Dimensions.height45(context),
                      width: Dimensions.widht100(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent),
                      child: Center(
                          child: Montserrat(
                        text: "Okay",
                        fontSize: Dimensions.font14(context),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> checkDialogs(
    BuildContext context,
    String text,
  ) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: Dimensions.minHeight50(context),
                right: 0,
                left: 0,
                child: Container(
                  height: Dimensions.height100(context),
                  width: Dimensions.widht100(context),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Icon(
                    Icons.check,
                    color: ColorClass.white,
                    size: 70,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.height50(context)),
              child: SizedBox(
                height: Dimensions.height100(context),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Montserrat(
                      text: "Success",
                      fontSize: Dimensions.font16(context),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    SizedBox(height: Dimensions.height10(context),),
                    Montserrat(
                        text: text,
                        fontSize: Dimensions.font16(context),
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    
                  ],
                ),
              ),
            )
          ],
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: Dimensions.height20(context)),
              child: InkWell(
                highlightColor: ColorClass.darkBlue.withOpacity(.4),
                splashColor: ColorClass.background.withOpacity(.6),
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20),
                    color: Colors.blue,
                  ),
                  child: Container(
                      height: Dimensions.height45(context),
                      width: Dimensions.widht100(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent),
                      child: Center(
                          child: Montserrat(
                        text: "Okay",
                        fontSize: Dimensions.font14(context),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
