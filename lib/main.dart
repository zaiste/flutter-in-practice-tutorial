import 'package:emailapp/App.dart';
import 'package:emailapp/Overseer.dart';
import 'package:emailapp/Provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.red),
        home: App(),
      ),
    );
  }
}
