import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class twitterpage extends StatefulWidget {
  @override
  _twitterpageState createState() => _twitterpageState();
}

class _twitterpageState extends State<twitterpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
        initialUrl: "https://twitter.com/fel7al",
          javascriptMode: JavascriptMode.unrestricted,
    ),
    );
  }
}
