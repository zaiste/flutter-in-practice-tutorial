import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageDetail extends StatelessWidget {
  final String subject;
  final String body;

  MessageDetail(this.subject, this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.subject)),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Html(
          data: body,
          onLinkTap: (link) async {
            if (await canLaunch(link)) {
              await launch(link);
            } else {
              throw "Link cannot be handled";
            }
          },
        ),
      ),
    );
  }
}
