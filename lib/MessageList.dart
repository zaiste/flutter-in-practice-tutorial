import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var messages = const [];

  Future loadMessageList() async {
    var content = await rootBundle.loadString('data/message.json');
    var collection = json.decode(content);

    setState(() {
      messages = collection;
    });s
  }

  void initState() {
    loadMessageList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          var message = messages[index];

          return ListTile(
            title: Text(message['subject']),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text('PJ'),
            ),
            subtitle: Text(
              message['body'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}
