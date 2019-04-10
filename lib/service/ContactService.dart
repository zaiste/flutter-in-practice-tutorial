import 'dart:async';
import 'dart:convert';

import 'package:emailapp/model/Contact.dart';
import 'package:http/http.dart' as http;

class ContactService {
  static String _url = "https://jsonplaceholder.typicode.com/users";

  static Future<List<Contact>> browse({String filter}) async {
    http.Response response = await http.get(_url);
    String content = response.body;

    List collection = json.decode(content);

    Iterable<Contact> _contacts = collection.map((_) => Contact.fromJson(_));

    if (filter != null && filter.isNotEmpty)
      _contacts = _contacts
          .where((contact) => contact.name.toLowerCase().contains(filter));

    return _contacts.toList();
  }
}

void main() async {
  List result = await ContactService.browse();
  print(result);
}
