import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:flutter/material.dart';

class BorderForm extends StatelessWidget {
  final Widget widget;
  const BorderForm({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height50(context),
      width: Dimensions.widht360(context),
      decoration: BoxDecoration(
          border: Border.all(color: ColorClass.white.withOpacity(.6)),
          borderRadius: BorderRadius.circular(10)),
      child: widget,
    );
  }
  
}