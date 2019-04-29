import 'package:flutter/material.dart';

class UglyProvider extends StatefulWidget {
  final Widget child;

  const UglyProvider({Key key, this.child}) : super(key: key);

  @override
  _UglyProviderState createState() => _UglyProviderState();

  static _UglyProviderState of(BuildContext context, {bool subscribe = true}) {
    return subscribe
        ? (context.inheritFromWidgetOfExactType(_UglyProvider) as _UglyProvider)
            .data
        : (context
                .ancestorInheritedElementForWidgetOfExactType(_UglyProvider)
                .widget as _UglyProvider)
            .data;
  }
}

class _UglyProviderState extends State<UglyProvider> {
  int counter;

  @override
  void initState() {
    counter = 1;
    super.initState();
  }

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _UglyProvider(data: this, child: widget.child);
  }
}

class _UglyProvider extends InheritedWidget {
  final _UglyProviderState data;

  _UglyProvider({Key key, this.data, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
