import 'package:emailapp/Message.dart';
import 'package:emailapp/Observer.dart';
import 'package:emailapp/Provider.dart';
import 'package:emailapp/manager/MessageFormManager.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  @override
  Widget build(BuildContext context) {
    MessageFormManager manager = Provider.of(context).fetch(MessageFormManager);

    return Scaffold(
      appBar: AppBar(
        title: Text("Compose New Message"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              ListTile(
                title: StreamBuilder<String>(
                  stream: manager.email$,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: manager.inEmail.add,
                      decoration: InputDecoration(
                        labelText: 'TO',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        errorText: snapshot.error,
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                title: StreamBuilder<Object>(
                    stream: manager.subject$,
                    builder: (context, snapshot) {
                      return TextField(
                        onChanged: manager.inSubject.add,
                        decoration: InputDecoration(
                          labelText: 'SUBJECT',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          errorText: snapshot.error,
                        ),
                      );
                    }),
              ),
              Divider(),
              ListTile(
                title: TextField(
                  onChanged: manager.inBody.add,
                  decoration: InputDecoration(
                    labelText: 'BODY',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  maxLines: 9,
                ),
              ),
              ListTile(
                title: StreamBuilder<Object>(
                    stream: manager.isFormValid$,
                    builder: (context, snapshot) {
                      return RaisedButton(
                        child: Text('SEND'),
                        onPressed: () {
                          if (snapshot.hasData) {
                            Message message = manager.submit();

                            Navigator.pop(context, message);
                          }
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
