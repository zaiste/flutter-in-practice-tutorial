import 'package:emailapp/AppDrawer.dart';
import 'package:emailapp/ContactManager.dart';
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
            StreamBuilder<Object>(
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
        body: StreamBuilder(
          stream: manager.contactListView,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //
            List<String> contacts = snapshot.data;
            return ListView.separated(
              itemCount: contacts?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                //
                return ListTile(
                  title: Text(contacts[index]),
                  leading: CircleAvatar(),
                );
              },
              separatorBuilder: (context, index) => Divider(),
            );
          },
        ),
      ),
      length: 2,
    );
  }
}
