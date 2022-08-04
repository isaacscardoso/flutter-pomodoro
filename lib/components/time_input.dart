import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/custom_elevated_button.dart';
import 'package:pomodoro_app/components/custom_text.dart';

class TimeInput extends StatelessWidget {
  final String title;
  final int timeAmount;
  final void Function() increment;
  final void Function() decrement;

  const TimeInput({
    Key? key,
    required this.title,
    required this.timeAmount,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomText(
          content: title,
          fontSize: 25,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomElevatedButton(
              onPressed: decrement,
              padding: const EdgeInsets.all(15),
              icon: Icons.arrow_downward,
            ),
            CustomText(
              content: '$timeAmount min',
              fontSize: 18,
            ),
            CustomElevatedButton(
              onPressed: increment,
              padding: const EdgeInsets.all(15),
              icon: Icons.arrow_upward,
            ),
          ],
        ),
      ],
    );
  }
}
