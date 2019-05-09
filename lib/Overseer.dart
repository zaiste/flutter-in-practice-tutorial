import 'package:emailapp/manager/ContactManager.dart';
import 'package:emailapp/manager/CounterManager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer() {
    register(ContactManager, ContactManager());
    register(CounterManager, CounterManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) => repository[name];
}
