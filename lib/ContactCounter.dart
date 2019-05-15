import 'package:emailapp/Observer.dart';
import 'package:emailapp/Provider.dart';
import 'package:emailapp/manager/ContactManager.dart';
import 'package:flutter/material.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

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
