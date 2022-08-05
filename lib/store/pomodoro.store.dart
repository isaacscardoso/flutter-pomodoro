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
  int workingTime = 25;
  @observable
  int restingTime = 5;
  @observable
  bool started = false;
  @observable
  int secondsRemaining = 0;
  @observable
  late int minutesRemaining = workingTime;

  @computed
  bool get isWorkingTime => currentState == CurrentState.working;
  @computed
  bool get isRestingTime => currentState == CurrentState.resting;

  @action
  void nowWorking() => currentState = CurrentState.working;
  @action
  void nowResting() => currentState = CurrentState.resting;

  @action
  void _decMinRem() => minutesRemaining--;
  @action
  void _decSecRem() => secondsRemaining--;

  @action
  void incWorkingTime() => workingTime++;
  @action
  void incRestingTime() => restingTime++;

  @action
  void decWorkingTime() {
    if (workingTime > 1) workingTime--;
  }

  @action
  void decRestingTime() {
    if (restingTime > 1) restingTime--;
  }

  @computed
  bool get incWorkIsValid => started && isWorkingTime;
  @computed
  bool get decWorkIsValid => (started && isWorkingTime) || (workingTime <= 1);
  @computed
  bool get incRestIsValid => started && isRestingTime;
  @computed
  bool get decRestIsValid => (started && isRestingTime) || (restingTime <= 1);

  @action
  void _toggleTimeRemaining() {
    if (isWorkingTime) {
      minutesRemaining = restingTime;
      nowResting();
    } else {
      minutesRemaining = workingTime;
      nowWorking();
    }
  }

  @action
  void start() {
    started = true;
    _stopwatch = Timer.periodic(
      const Duration(milliseconds: 50),
      (timer) {
        if (minutesRemaining == 0 && secondsRemaining == 0) {
          _toggleTimeRemaining();
        } else if (secondsRemaining == 0) {
          secondsRemaining = 59;
          _decMinRem();
        } else {
          _decSecRem();
        }
      },
    );
  }

  @action
  void stop() {
    started = false;
    _stopwatch?.cancel();
  }

  @action
  void reset() {
    secondsRemaining = 0;
    minutesRemaining = isWorkingTime ? workingTime : restingTime;
    stop();
  }
}
