import 'package:emailapp/App.dart';
import 'package:emailapp/service/ContactService.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/Overseer.dart';
import 'package:sprinkle/Provider.dart';
import 'package:sprinkle/WebResourceManager.dart';

import 'manager/CounterManager.dart';
import 'manager/MessageFormManager.dart';
import 'model/Contact.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer()
          .register<MessageFormManager>(() => MessageFormManager())
          .register<CounterManager>(() => CounterManager())
          .register<WebResourceManager<Contact>>(
              () => WebResourceManager<Contact>(ContactService())),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.red),
        home: App(),
      ),
    );
  }
}
