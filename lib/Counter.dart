import 'package:emailapp/UglyProvider.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = UglyProvider.of(context, subscribe: true);
    var counter = state.counter;

    return Center(child: Text("Calendar: $counter"));
  }
}
