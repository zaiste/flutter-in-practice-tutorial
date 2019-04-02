import 'dart:async';

import 'package:emailapp/model/Contact.dart';
import 'package:emailapp/service/ContactService.dart';

class ContactManager {
  final StreamController<int> _contactCount = StreamController<int>();
  Stream<int> get contactCount => _contactCount.stream;

  Stream<List<Contact>> get contactListView async* {
    yield await ContactService.browse();
  }

  ContactManager() {
    contactListView.listen((list) => _contactCount.add(list.length));
  }
}
