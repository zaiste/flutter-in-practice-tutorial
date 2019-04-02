class Contact {
  final String name;
  final String email;
  final String phone;

  Contact.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phone = json['phone'];
}
