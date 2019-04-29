import 'package:emailapp/App.dart';
import 'package:emailapp/Provider.dart';
import 'package:emailapp/UglyProvider.dart';
import 'package:emailapp/manager/ContactManager.dart';
import 'package:flutter/material.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ContactManager>(
      data: ContactManager(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.red),
        home: UglyProvider(child: App()),
      ),
    );
  }
}
