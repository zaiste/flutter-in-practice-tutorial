import 'dart:async';

import 'package:emailapp/model/Contact.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/Observer.dart';

class ContactListBuilder extends StatelessWidget {
  @required
  final Function builder;
  final Stream stream;

  ContactListBuilder({this.builder, this.stream});

  @override
  Widget build(BuildContext context) {
    return Observer<List<Contact>>(
      stream: stream,
      onSuccess: (BuildContext context, List<Contact> data) =>
          builder(context, data),
      onWaiting: (context) => LinearProgressIndicator(),
    );
  }
}
