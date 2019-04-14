import 'dart:async';

import 'package:emailapp/model/Contact.dart';
import 'package:emailapp/service/ContactService.dart';

import 'package:rxdart/rxdart.dart';

class ContactManager {
  final BehaviorSubject<int> _contactCount = BehaviorSubject<int>();
  Stream<int> get contactCount => _contactCount.stream;

  Stream<List<Contact>> get contactListView =>
      Stream.fromFuture(ContactService.browse());

  Stream<List<Contact>> filteredView({String filter}) =>
      Stream.fromFuture(ContactService.browse(filter: filter));

  ContactManager() {
    contactListView.listen((list) => _contactCount.add(list.length));
  }

  void dispose() {
    _contactCount.close();
  }
}
