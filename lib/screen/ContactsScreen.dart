import 'package:emailapp/AppDrawer.dart';
import 'package:emailapp/ContactListBuilder.dart';
import 'package:emailapp/manager/ContactManager.dart';
import 'package:emailapp/screen/ContactSearch.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  final manager = ContactManager();

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
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: ContactSearch(manager: manager),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: ContactListBuilder(
          stream: manager.contactListView,
          builder: (context, contacts) {
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
          },
        ),
      ),
      length: 2,
    );
  }
}
