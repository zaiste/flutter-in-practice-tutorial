import 'package:emailapp/Manager.dart';
import 'package:emailapp/manager/ContactManager.dart';
import 'package:emailapp/manager/CounterManager.dart';
import 'package:emailapp/manager/MessageFormManager.dart';

class Overseer {
  Map<dynamic, Manager> repository = {};

  Map<dynamic, Function> _factories = {
    ContactManager: () => ContactManager(),
    CounterManager: () => CounterManager(),
    MessageFormManager: () => MessageFormManager()
  };

  static final Overseer _singleton = Overseer._internal();
  Overseer._internal();
  factory Overseer() => _singleton;

  _summon(name) => repository[name] = _factories[name]();

  fetch(name) =>
      repository.containsKey(name) ? repository[name] : _summon(name);

  release(name) {
    Manager manager = repository[name];
    manager.dispose();
    repository.remove(name);
  }
}
