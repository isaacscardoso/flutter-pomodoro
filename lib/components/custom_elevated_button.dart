import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final EdgeInsetsGeometry padding;
  final IconData icon;
  final OutlinedBorder? shape;
  final Color? primaryColor;
  final Color? iconColor;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.padding,
    required this.icon,
    this.shape,
    this.primaryColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding,
        shape: shape ?? const CircleBorder(),
        primary: primaryColor ?? Colors.purpleAccent,
      ),
      child: Icon(
        icon,
        color: iconColor ?? Colors.white,
      ),
    );
  }
}
