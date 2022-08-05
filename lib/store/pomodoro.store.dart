import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = PomodoroStoreBase with _$PomodoroStore;

enum CurrentState { working, resting }

abstract class PomodoroStoreBase with Store {
  @observable
  CurrentState currentState = CurrentState.resting;

  @observable
  int _workingTime = 25;
  @observable
  int _restingTime = 5;
  @observable
  bool _started = false;
  @observable
  int _secondsRemaining = 0;
  @observable
  late int _minutesRemaining = restingTime;

  @computed
  int get workingTime => _workingTime;
  @computed
  int get restingTime => _restingTime;
  @computed
  String get minutesRemaining => _minutesRemaining.toString();
  @computed
  String get secondsRemaining => _secondsRemaining.toString();
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
  void incrementWorkingTime() => _workingTime++;
  @action
  void decrementWorkingTime() => _workingTime--;

  @action
  void incrementRestingTime() => _restingTime++;
  @action
  void decrementRestingTime() => _restingTime--;

  @action
  void toggleTimeRemaining() => isWorkingTime
      ? _minutesRemaining = workingTime
      : _minutesRemaining = restingTime;

  @action
  void start() {
    _started = true;
    nowWorking();
    toggleTimeRemaining();
  }

  @action
  void stop() {
    _started = false;
    nowResting();
    toggleTimeRemaining();
  }

  @action
  void reset() {
    _workingTime = 25;
    _restingTime = 5;
    _secondsRemaining = 0;
    _minutesRemaining = restingTime;
    stop();
  }
}
