import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class instapage extends StatefulWidget {
  @override
  _instapageState createState() => _instapageState();
}

class _instapageState extends State<instapage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
        initialUrl: "https://www.instagram.com/fel7alco/",
            javascriptMode: JavascriptMode.unrestricted,
    ),
    );
  }
}
