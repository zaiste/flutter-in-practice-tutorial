import 'package:emailapp/ContactListBuilder.dart';
import 'package:emailapp/model/Contact.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/SprinkleExtension.dart';
import 'package:sprinkle/WebResourceManager.dart';

class ContactSearch extends SearchDelegate {
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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    WebResourceManager<Contact> manager =
        context.fetch<WebResourceManager<Contact>>();

    manager.inFilter.add(query);

    return ContactListBuilder(
      stream: manager.collection$,
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
}
