import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:flutter/material.dart';

class HiddenText extends StatefulWidget {
  final BuildContext context;
  final String text;
  const HiddenText({super.key, required this.context, required this.text});

  @override
  State<HiddenText> createState() => _HiddenTextState();
}

class _HiddenTextState extends State<HiddenText> {
  String firstText = "";
  String lastText = "";
  bool hidden = true;
  double textHeight = 10;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstText = widget.text.substring(0, textHeight.toInt());
      lastText =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstText = widget.text;
      lastText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return lastText.isEmpty
        ? PoppinText(
            aligment: TextAlign.end,
            text: widget.text,
            fontSize: Dimensions.font12(context),
            weight: FontWeight.w600,
            color: Colors.white.withOpacity(.6))
        : PoppinText(
            aligment: TextAlign.end,
            text: hidden ? "$firstText..." : lastText,
            fontSize: Dimensions.font12(context),
            weight: FontWeight.w600,
            color: Colors.white.withOpacity(.6));
  }
}
