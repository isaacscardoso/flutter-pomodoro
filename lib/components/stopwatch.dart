import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/custom_text.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          CustomText(
            content: 'Hora de Estudar',
            fontSize: 40,
            textColor: Colors.white,
          ),
          CustomText(
            content: '25:00',
            fontSize: 120,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
