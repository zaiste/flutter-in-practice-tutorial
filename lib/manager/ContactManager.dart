import 'dart:async';

import 'package:emailapp/model/Contact.dart';
import 'package:emailapp/service/ContactService.dart';

import 'package:rxdart/rxdart.dart';

class ContactManager {
  final BehaviorSubject<int> _contactCount = BehaviorSubject<int>();

  Stream<int> get count$ => _contactCount.stream;
  Stream<List<Contact>> browse$({String filter}) =>
      Stream.fromFuture(ContactService.browse(filter: filter));

  ContactManager() {
    browse$().listen((list) => _contactCount.add(list.length));
  }

  void dispose() {
    _contactCount.close();
  }
}
