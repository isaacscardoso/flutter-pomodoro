import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_app/components/custom_elevated_button.dart';
import 'package:pomodoro_app/components/custom_text.dart';
import 'package:pomodoro_app/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class TimeInput extends StatelessWidget {
  final String title;
  final int timeAmount;
  final void Function()? increment;
  final void Function()? decrement;

  const TimeInput({
    Key? key,
    required this.title,
    required this.timeAmount,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PomodoroStore pomodoroStore = Provider.of<PomodoroStore>(context);

    return Column(
      children: <Widget>[
        CustomText(content: title, fontSize: 25),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (_) => CustomElevatedButton(
                onPressed: decrement,
                padding: const EdgeInsets.all(15),
                icon: Icons.arrow_downward,
                primaryColor:
                    pomodoroStore.isWorkingTime ? Colors.red : Colors.green,
              ),
            ),
            CustomText(
              content: '$timeAmount min',
              fontSize: 18,
            ),
            Observer(
              builder: (_) => CustomElevatedButton(
                onPressed: increment,
                padding: const EdgeInsets.all(15),
                icon: Icons.arrow_upward,
                primaryColor:
                    pomodoroStore.isWorkingTime ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
