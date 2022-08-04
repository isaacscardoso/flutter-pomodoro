import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
  final Color? primaryColor;
  final Widget? child;
  final Color? iconColor;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    this.icon,
    this.padding,
    this.shape,
    this.primaryColor,
    this.child,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding,
        shape: shape ?? const CircleBorder(),
        primary: primaryColor,
      ),
      child: child ??
          (icon != null ? Icon(icon, color: iconColor ?? Colors.white) : null),
    );
  }
}
