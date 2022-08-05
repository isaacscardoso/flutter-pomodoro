import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/custom_elevated_button.dart';
import 'package:pomodoro_app/components/custom_text.dart';

class StopwatchButton extends CustomElevatedButton {
  final String content;

  const StopwatchButton({
    Key? key,
    required this.content,
    super.icon,
    super.onPressed,
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
            child: icon != null ? Icon(icon, size: 28) : null,
          ),
          CustomText(content: content, fontSize: 20)
        ],
      ),
    );
  }
}
