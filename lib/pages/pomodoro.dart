import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/stopwatch.dart';
import 'package:pomodoro_app/components/time_input.dart';
import 'package:pomodoro_app/store/pomodoro.store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PomodoroStore pomodoroStore = Provider.of<PomodoroStore>(context);

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
              children: <Widget>[
                Observer(
                  builder: (_) => TimeInput(
                    title: 'Estudar',
                    timeAmount: pomodoroStore.workingTime,
                    increment: pomodoroStore.incrementWorkingTime,
                    decrement: pomodoroStore.decrementWorkingTime,
                  ),
                ),
                Observer(
                  builder: (_) => TimeInput(
                    title: 'Descansar',
                    timeAmount: pomodoroStore.restingTime,
                    increment: pomodoroStore.incrementRestingTime,
                    decrement: pomodoroStore.decrementRestingTime,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
