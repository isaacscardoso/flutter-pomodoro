import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/custom_elevated_button.dart';

class TimeInput extends StatelessWidget {
  final String title;
  final int timeAmount;

  const TimeInput({
    Key? key,
    required this.title,
    required this.timeAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomElevatedButton(
              customOnPressed: () {},
              customPadding: const EdgeInsets.all(15),
              customChildIcon: Icons.arrow_downward,
            ),
            Text(
              '$timeAmount min',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            CustomElevatedButton(
              customOnPressed: () {},
              customPadding: const EdgeInsets.all(15),
              customChildIcon: Icons.arrow_upward,
            ),
          ],
        ),
      ],
    );
  }
}
