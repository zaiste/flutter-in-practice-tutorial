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


  fetch(name) => repository[name];
}
