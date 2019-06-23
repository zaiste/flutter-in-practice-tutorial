import 'dart:async';

import 'package:rxdart/rxdart.dart';

class MessageFormManager {
  final _email = BehaviorSubject<String>.seeded("@");

  Stream<String> get email$ => _email.stream.transform(validateEmail);
  Sink<String> get inEmail => _email.sink;

  static bool isEmail(String email) => email.contains('@');

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      sink.add(value);
    } else {
      sink.addError('Our message error');
    }
  });
}
