import 'dart:async';

import 'package:rxdart/rxdart.dart';

class CounterManager {
  BehaviorSubject<int> _counter = BehaviorSubject<int>.seeded(0);
  int get _current => _counter.value;

  Stream<int> get counter$ => _counter.stream;
  void increment() => _counter.add(_current + 1);
  void decrement() => _counter.add(_current - 1);
}
