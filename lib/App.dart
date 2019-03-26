import 'package:emailapp/AppDrawer.dart';
import 'package:emailapp/MessageList.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () async {},
              )
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "Important"),
                Tab(text: "Other"),
              ],
            ),
          ),
          drawer: AppDrawer(),
          body: TabBarView(
            children: <Widget>[
              MessageList(status: 'important'),
              MessageList(status: 'other'),
            ],
          )),
      length: 2,
    );
  }
}
