import 'package:emailapp/AppDrawer.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Contacts")),
      ),
      length: 2,
    );
  }
}
