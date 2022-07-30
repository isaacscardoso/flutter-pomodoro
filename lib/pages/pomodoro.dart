import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/time_input.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[
          Text('Pomodoro'),
          TimeInput(title: 'Study Flutter', timeAmount: 25),
          TimeInput(title: 'Coffe Break', timeAmount: 6),
        ],
      ),
    );
  }
}
