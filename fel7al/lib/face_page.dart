import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class facepage extends StatefulWidget {
  @override
  _facepageState createState() => _facepageState();
}

class _facepageState extends State<facepage> {
  @override
  Widget build(BuildContext context) {
    return WebView(
        initialUrl: "https://www.facebook.com/fel7al",
        javascriptMode: JavascriptMode.unrestricted,

    );
  }
}
