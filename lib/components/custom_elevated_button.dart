import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() customOnPressed;
  final EdgeInsetsGeometry customPadding;
  final IconData customChildIcon;
  final OutlinedBorder? customShape;
  final Color? customPrimary;
  final Color? customChildIconColor;

  const CustomElevatedButton({
    Key? key,
    required this.customOnPressed,
    required this.customPadding,
    required this.customChildIcon,
    this.customShape,
    this.customPrimary,
    this.customChildIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: customOnPressed,
      style: ElevatedButton.styleFrom(
        padding: customPadding,
        shape: customShape ?? const CircleBorder(),
        primary: customPrimary ?? Colors.purpleAccent,
      ),
      child: Icon(
        customChildIcon,
        color: customChildIconColor ?? Colors.white,
      ),
    );
  }
}
