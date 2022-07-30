import 'package:flutter/material.dart';

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
        Text(title),
        Text(timeAmount.toString()),
      ],
    );
  }
}
