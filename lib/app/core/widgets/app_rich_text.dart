import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_style.dart';

class MyRichText extends StatelessWidget {
  final String startText, endText;
  final double fontSize;
  final FontWeight frontFontWeight, endFontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final Color frontTextColor, endTextColor;
  final bool isLightEndColor;
  final Function()? onTap;

  const MyRichText({
    super.key,
    this.startText = "",
    this.endText = "",
    this.fontSize = 14,
    this.frontFontWeight = FontWeight.w600,
    this.endFontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.textOverflow,
    this.maxLines,
    this.frontTextColor = AppColor.black,
    this.endTextColor = AppColor.black,
    this.isLightEndColor = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: startText,
        children: [
          TextSpan(
            text: " $endText",
            style: textRegularStyle(
              fontSize: fontSize,
              fontWeight: endFontWeight,
              color: isLightEndColor
                  ? endTextColor.withOpacity(0.7)
                  : endTextColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: textRegularStyle(
        fontSize: fontSize,
        fontWeight: frontFontWeight,
        lineHeight: 1.3,
        color: frontTextColor,
      ),
    );
  }
}
