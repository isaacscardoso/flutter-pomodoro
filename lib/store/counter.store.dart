import 'package:mobx/mobx.dart';
part 'counter.store.g.dart';

class CounterStore = CounterStoreBase with _$CounterStore;

abstract class CounterStoreBase with Store {
  @observable
  int _count = 0;

  int get count => _count;

  @action
  void increment() => _count++;
}
