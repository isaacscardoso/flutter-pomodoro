import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = PomodoroStoreBase with _$PomodoroStore;

abstract class PomodoroStoreBase with Store {
  @observable
  bool _started = false;

  @computed
  bool get started => _started;

  @observable
  int _minutes = 25;

  @computed
  int get minutes => _minutes;

  @observable
  int _seconds = 0;

  @computed
  int get seconds => _seconds;

  @observable
  int _workingTime = 2;

  @computed
  int get workingTime => _workingTime;

  @observable
  int _restTime = 1;

  @computed
  int get restTime => _restTime;

  @action
  void toggleStarted() => _started = !_started;

  @action
  void reset() => _started = false;

  @action
  void incrementWorkingTime() => _workingTime++;

  @action
  void decrementWorkingTime() => _workingTime--;

  @action
  void incrementRestTime() => _restTime++;

  @action
  void decrementRestTime() => _restTime--;
}
