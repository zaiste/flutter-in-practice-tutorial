import 'dart:async';
import 'dart:convert';

import 'package:emailapp/model/Contact.dart';
import 'package:http/http.dart' as http;
import 'package:sprinkle/Service.dart';

class ContactService implements Service<Contact> {
  String _url = "http://fip.zaiste.net/contacts";

  Future<List<Contact>> browse({String filter}) async {
    http.Response response = await http.get("$_url?q=$filter");
    String content = response.body;

    await Future.delayed(Duration(seconds: 1));

    List collection = json.decode(content);

    Iterable<Contact> _contacts = collection.map((_) => Contact.fromJson(_));

    return _contacts.toList();
  }
}
