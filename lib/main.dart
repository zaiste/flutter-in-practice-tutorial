import 'package:emailapp/App.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/Overseer.dart';
import 'package:sprinkle/Provider.dart';

import 'manager/ContactManager.dart';
import 'manager/CounterManager.dart';
import 'manager/MessageFormManager.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer({
        ContactManager: () => ContactManager(),
        CounterManager: () => CounterManager(),
        MessageFormManager: () => MessageFormManager()
      }),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.red),
        home: App(),
      ),
    );
  }
}
