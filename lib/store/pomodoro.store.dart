import 'package:mobx/mobx.dart';
part 'pomodoro.store.g.dart';

class PomodoroStore = PomodoroStoreBase with _$PomodoroStore;

abstract class PomodoroStoreBase with Store {

  @observable
  int _workingTime = 2;

  @observable
  int _restTime = 1;

  @computed
  int get workingTime => _workingTime;

  @computed
  int get restTime => _restTime;

  @action
  void incrementWorkingTime() => _workingTime++;

  @action
  void decrementWorkingTime() => _workingTime--;

  @action
  void incrementRestTime() => _restTime++;

  @action
  void decrementRestTime() => _restTime--;
}