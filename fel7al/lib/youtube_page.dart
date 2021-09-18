import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class youtube_page extends StatefulWidget {
  @override
  _facepageState createState() => _facepageState();
}

class _facepageState extends State<youtube_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: "https://www.youtube.com/channel/UCVccnkvjG1Rkh_462y3k3BQ",
          javascriptMode: JavascriptMode.unrestricted
      ),
    );
  }
}