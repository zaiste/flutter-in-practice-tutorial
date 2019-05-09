import 'package:emailapp/AppDrawer.dart';
import 'package:emailapp/Counter.dart';
import 'package:emailapp/FabButton.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      drawer: AppDrawer(),
      body: Counter(),
      floatingActionButton: FabButton(),
    );
  }
}
