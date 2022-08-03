import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/custom_text.dart';
import 'package:pomodoro_app/components/stopwatch_button.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CustomText(
            content: 'Hora de Estudar',
            fontSize: 45,
            textColor: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: CustomText(
              content: '25:00',
              fontSize: 120,
              textColor: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StopwatchButton(
                content: 'Iniciar',
                onPressed: () {},
                icon: Icons.play_arrow,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: StopwatchButton(
                  content: 'Parar',
                  onPressed: () {},
                  icon: Icons.stop,
                ),
              ),
              StopwatchButton(
                content: 'Reiniciar',
                onPressed: () {},
                icon: Icons.refresh,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
