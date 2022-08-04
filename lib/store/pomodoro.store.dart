import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = PomodoroStoreBase with _$PomodoroStore;

enum CurrentState { working, resting }

abstract class PomodoroStoreBase with Store {
  // Current State
  @observable
  CurrentState currentState = CurrentState.resting;

  @computed
  bool get isWorkingTime => currentState == CurrentState.working;

  @computed
  bool get isRestingTime => currentState == CurrentState.resting;

  @action
  void nowWorking() => currentState = CurrentState.working;

  @action
  void nowResting() => currentState = CurrentState.resting;
  //

  // Rest Time
  @observable
  int _restTime = 1;

  @computed
  int get restTime => _restTime;

  @action
  void incrementRestTime() => _restTime++;

  @action
  void decrementRestTime() => _restTime--;
  //

  // Working Time
  @observable
  int _workingTime = 2;

  @computed
  int get workingTime => _workingTime;

  @action
  void incrementWorkingTime() => _workingTime++;

  @action
  void decrementWorkingTime() => _workingTime--;
  //

  // Minutes
  @observable
  int _minutes = 0;

  @computed
  String get minutes => _minutes.toString();
  //

  // Seconds
  @observable
  int _seconds = 0;

  @computed
  String get seconds => _seconds.toString();
  //

  // Clock Functions
  @observable
  bool _started = false;

  @computed
  bool get started => _started;

  @action
  void start() {
    _started = true;
    nowWorking();
  }

  @action
  void stop() {
    _started = false;
    nowResting();
  }

  @action
  void reset() {
    _minutes = 25;
    _seconds = 0;
    stop();
  }
  //
}
