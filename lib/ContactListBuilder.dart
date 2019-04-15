import 'dart:async';

import 'package:emailapp/Provider.dart';
import 'package:emailapp/manager/ContactManager.dart';
import 'package:emailapp/model/Contact.dart';
import 'package:flutter/material.dart';

class ContactListBuilder extends StatelessWidget {
  @required
  final Function builder;

  ContactListBuilder({this.builder});

  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of<ContactManager>(context);

    return StreamBuilder<List<Contact>>(
      stream: manager.contactListView,
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            List<Contact> contacts = snapshot.data;

            return builder(context, contacts);
        }
      },
    );
  }
}
