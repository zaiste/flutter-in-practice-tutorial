import 'package:emailapp/AppDrawer.dart';
import 'package:emailapp/ContactManager.dart';
import 'package:emailapp/model/Contact.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  final ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          actions: <Widget>[
            StreamBuilder<int>(
              stream: manager.contactCount,
              builder: (context, snapshot) {
                return Chip(
                  label: Text(
                    (snapshot.data ?? 0).toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: StreamBuilder<List<Contact>>(
          stream: manager.contactListView,
          builder:
              (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                List<Contact> contacts = snapshot.data;
                return ListView.separated(
                  itemCount: contacts?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    //
                    return ListTile(
                      title: Text(contacts[index].name),
                      subtitle: Text(contacts[index].email),
                      leading: CircleAvatar(),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                );
            }
          },
        ),
      ),
      length: 2,
    );
  }
}
