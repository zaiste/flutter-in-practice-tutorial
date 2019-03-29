import 'dart:async';

const List<String> CONTACTS = ["User 1", "User 2", "User 3", "User 4"];

class ContactManager {
  final StreamController<int> _contactCount = StreamController<int>();
  Stream<int> get contactCount => _contactCount.stream;

  Stream<List<String>> get contactListView async* {
    for (var i = 0; i < CONTACTS.length; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield CONTACTS.sublist(0, i + 1);
    }
  }

  ContactManager() {
    contactListView.listen((list) => _contactCount.add(list.length));
  }
}
