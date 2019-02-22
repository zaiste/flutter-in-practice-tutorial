class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  Message.fromJson(Map<String, dynamic> json)
      : subject = json['subject'],
        body = json['body'];
}
