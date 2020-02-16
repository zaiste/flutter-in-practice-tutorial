import 'package:flutter/material.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/SprinkleExtension.dart';
import 'package:sprinkle/WebResourceManager.dart';

import 'model/Contact.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WebResourceManager<Contact> manager =
        context.fetch<WebResourceManager<Contact>>();

    return Observer<int>(
      stream: manager.count$,
      onSuccess: (context, data) {
        return Chip(
          label: Text(
            (data ?? 0).toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.red,
        );
      },
    );
  }
}
