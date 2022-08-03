import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/stopwatch.dart';
import 'package:pomodoro_app/components/time_input.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Expanded(
            child: Stopwatch(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                TimeInput(title: 'Estudar', timeAmount: 25),
                TimeInput(title: 'Descansar', timeAmount: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
