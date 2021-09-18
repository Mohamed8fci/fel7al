import 'dart:async';

import 'dart:io';
import 'package:fel7al/second_page.dart';
import 'package:fel7al/twitter_page.dart';
import 'package:fel7al/youtube_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'face_page.dart';
import 'insta_page.dart';
import 'globals.dart' as globals;

class mainpage extends StatefulWidget {
  @override
  _mainpageState createState() => _mainpageState();
}

bool connectionStatus = true;
Future check() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connectionStatus = true;
    }
  } on SocketException catch (_) {
    connectionStatus = false;
  }
}

class _mainpageState extends State<mainpage> {
  DateTime backbuttonpressedTime;
  static final String oneSignalAppId = 'd54c9ed6-1eb6-4e55-ba9e-9e795a318153';

  @override
  void initState() {
    super.initState();
    initPlatformState();

  }

  Future<void> initPlatformState() async {
    OneSignal.shared.init(
      oneSignalAppId,
      iOSSettings: {
        OSiOSSettings.autoPrompt: true,
        OSiOSSettings.inAppLaunchUrl: true
      },
    );

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    //This method only work when app is in foreground.
    OneSignal.shared.setNotificationReceivedHandler(
          (OSNotification notification) async {
        print('setNotificationReceivedHandler');
      },
    );

    OneSignal.shared.setNotificationOpenedHandler(
          (OSNotificationOpenedResult result) async {
        var data = result.notification.payload.additionalData;
        globals.appNavigator.currentState.push(
          MaterialPageRoute(
            builder: (context) => SecondPage(
              postUrl: data['post_url'],
            ),
          ),
        );
      },
    );
  }
  Completer<WebViewController> _controller = Completer<WebViewController>();
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
      body: FutureBuilder(
          future: check(), // a previously-obtained Future or null
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (connectionStatus == true) {
              return WillPopScope(
                onWillPop: _willPopCallback,
                child: WebView(
                  initialUrl: 'https://fel7al.com/',
                    javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                ),
              );
            } else {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text('No internet connection !!!',
                        style: TextStyle(
                          // your text
                          fontFamily: 'Aleo',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        )),
                  ),
                  /* RaisedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Color(0xFF673AB7),
                    textColor: Colors.white,
                    child: Text('Refresh'),
                  ), */
                  // your button beneath text
                ],
              ));
            }
          }),
    );
  }

  Future<bool> _willPopCallback() async {
    WebViewController webViewController = await _controller.future;
    bool canNavigate = await webViewController.canGoBack();
    if (canNavigate) {
      webViewController.goBack();
      return false;
    } else {
      return true;
    }
  }

}
