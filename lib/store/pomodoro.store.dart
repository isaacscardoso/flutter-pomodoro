import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = PomodoroStoreBase with _$PomodoroStore;

enum CurrentState { working, resting }

abstract class PomodoroStoreBase with Store {
  @observable
  CurrentState currentState = CurrentState.working;

  Timer? _stopwatch;

  @observable
  int _workingTime = 25;
  @observable
  int _restingTime = 5;
  @observable
  bool _started = false;
  @observable
  int _secondsRemaining = 0;
  @observable
  late int _minutesRemaining = workingTime;

  @computed
  int get workingTime => _workingTime;
  @computed
  int get restingTime => _restingTime;
  @computed
  int get minutesRemaining => _minutesRemaining;
  @computed
  int get secondsRemaining => _secondsRemaining;
  @computed
  bool get started => _started;

  @computed
  bool get isWorkingTime => currentState == CurrentState.working;
  @computed
  bool get isRestingTime => currentState == CurrentState.resting;

  @action
  void nowWorking() => currentState = CurrentState.working;
  @action
  void nowResting() => currentState = CurrentState.resting;

  @action
  void _incrementMinutesRemaining() => _minutesRemaining++;
  @action
  void _decrementMinutesRemaining() => _minutesRemaining--;

  @action
  void _incrementSecondsRemaining() => _secondsRemaining++;
  @action
  void _decrementSecondsRemaining() => _secondsRemaining--;

  @action
  void incrementWorkingTime() => _workingTime++;

  @action
  void decrementWorkingTime() {
    if (_workingTime > 1) _workingTime--;
  }

  @action
  void incrementRestingTime() => _restingTime++;

  @action
  void decrementRestingTime() {
    if (_restingTime > 1) _restingTime--;
  }

  @action
  void _toggleTimeRemaining() {
    if (isWorkingTime) {
      _minutesRemaining = restingTime;
      nowResting();
    } else {
      _minutesRemaining = workingTime;
      nowWorking();
    }
  }

  @action
  void start() {
    _started = true;
    _stopwatch = Timer.periodic(
      const Duration(milliseconds: 50),
      (timer) {
        if (minutesRemaining == 0 && secondsRemaining == 0) {
          _toggleTimeRemaining();
        } else if (secondsRemaining == 0) {
          _secondsRemaining = 59;
          _decrementMinutesRemaining();
        } else {
          _decrementSecondsRemaining();
        }
      },
    );
  }

  @action
  void stop() {
    _started = false;
    _stopwatch?.cancel();
  }

  @action
  void reset() {
    _secondsRemaining = 0;
    _minutesRemaining = isWorkingTime ? _workingTime : _restingTime;
    stop();
  }
}
