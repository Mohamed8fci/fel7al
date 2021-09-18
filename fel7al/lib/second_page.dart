import 'package:fel7al/face_page.dart';
import 'package:fel7al/youtube_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'insta_page.dart';
import 'twitter_page.dart';

class SecondPage extends StatefulWidget {

  final String postUrl;

  SecondPage({Key key, @required this.postUrl}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
          backgroundColor: Color(0xfffdc12a),
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => facepage(),
                      ),
                    );
                  },
                  icon: Icon(
                    FontAwesomeIcons.facebook,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => instapage(),
                      ),
                    );
                  },
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => twitterpage(),
                      ),
                    );
                  },
                  icon: Icon(
                    FontAwesomeIcons.twitter,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => youtube_page(),
                      ),
                    );
                  },
                  icon: Icon(
                    FontAwesomeIcons.youtube,
                  ),
                ),
              ],
            ),
          )),
      body: WebView(
        initialUrl: (this.widget.postUrl),
          javascriptMode: JavascriptMode.unrestricted
      ),
    );
  }
}