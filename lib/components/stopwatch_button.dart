import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/custom_elevated_button.dart';
import 'package:pomodoro_app/components/custom_text.dart';

class StopwatchButton extends CustomElevatedButton {
  final String content;

  const StopwatchButton({
    Key? key,
    required this.content,
    required super.onPressed,
    required super.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: onPressed,
      primaryColor: Colors.black,
      shape: const RoundedRectangleBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(icon, size: 28),
          ),
          CustomText(content: content, fontSize: 20)
        ],
      ),
    );
  }
}
