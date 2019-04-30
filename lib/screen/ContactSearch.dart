import 'package:emailapp/ContactListBuilder.dart';
import 'package:emailapp/Overseer.dart';
import 'package:emailapp/Provider.dart';
import 'package:emailapp/manager/ContactManager.dart';
import 'package:flutter/material.dart';

class ContactSearch extends SearchDelegate {
  final ContactManager manager;

  ContactSearch({this.manager});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    if (query.length < 3) {
      return Center(
        child: Text("Type at least 3 letters to search"),
      );
    }

    return ContactListBuilder(
      stream: manager.filteredView(filter: query),
      builder: (context, contacts) {
        return ListView.separated(
          itemCount: contacts?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(contacts[index].name),
              subtitle: Text(contacts[index].email),
              leading: CircleAvatar(),
            );
          },
          separatorBuilder: (context, index) => Divider(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
