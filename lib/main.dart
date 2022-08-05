import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_app/pages/pomodoro.dart';
import 'package:pomodoro_app/store/pomodoro.store.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const Pomodoro(),
      ),
    );
  }
}
