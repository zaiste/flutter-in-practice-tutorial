import 'package:emailapp/manager/CounterManager.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/SprinkleExtension.dart';

extension TextExtension on Widget {
  observe(Stream stream) {
    return Observer<int>(
      stream: stream,
      onSuccess: (context, data) {
        return this;
      },
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager manager = context.fetch<CounterManager>();

    return Center(
      child: Observer<int>(
        stream: manager.counter$,
        onSuccess: (context, data) => Text("Calendar: $data"),
      ),
    );
  }
}
