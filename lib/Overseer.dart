import 'package:emailapp/manager/ContactManager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer() {
    register(ContactManager, ContactManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) => repository[name];
}
