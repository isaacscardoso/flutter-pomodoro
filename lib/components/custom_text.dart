import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String content;
  final double fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;

  const CustomText({
    Key? key,
    required this.content,
    required this.fontSize,
    this.textColor,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
