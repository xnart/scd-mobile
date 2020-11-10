import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:scd_app/components/form_card.dart';
import 'package:scd_app/components/my_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "About",
      ),
      body: Container(
        padding: EdgeInsets.all(3),
        child: FormCard(
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                "I developed this app to help suffer from inflammatory bowel diseases patients like me. "
                "It is completely free and always will be free. ",
                textScaleFactor: 1.3,
              ),
              SizedBox(height: 15),
              Text(
                "I don't collect your personal information. You can use app anonymously. "
                "If you want to synchronize your data you can use with your email and password. "
                "Do not need another information.",
                textScaleFactor: 1.3,
              ),
              SizedBox(height: 15),
              Text(
                "If you have any concern, feedback or feature request you can send me a email via: ",
                textScaleFactor: 1.3,
              ),
              SizedBox(height: 5),
              Linkify(
                onOpen: (link) => launch(link.url),
                text: "mailto:bekirdurak97@gmail.com",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(height: 15),
              Divider(),
              SizedBox(height: 15),
              Text(
                "Big thanks to who contributed to this diet. It saved my life. I hope it will save yours too.",
                textScaleFactor: 1.2,
              ),
              SizedBox(height: 15),
              Text(
                "- Bekir Durak",
                textScaleFactor: 1.2,
                textAlign: TextAlign.right,
              )
            ],
          ),
        ),
      ),
    );
  }
}
