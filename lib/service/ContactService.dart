import 'dart:async';
import 'dart:convert';

import 'package:emailapp/model/Contact.dart';
import 'package:http/http.dart' as http;

class ContactService {
  static String _url = "https://jsonplaceholder.typicode.com/users";

  static Future<List<Contact>> browse() async {
    http.Response response = await http.get(_url);
    String content = response.body;

    await Future.delayed(Duration(seconds: 3));
    List collection = json.decode(content);

    List _contacts = collection.map((_) => Contact.fromJson(_)).toList();

    return _contacts;
  }
}

void main() async {
  List result = await ContactService.browse();
  print(result);
}
