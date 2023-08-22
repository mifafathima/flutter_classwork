import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewEx extends StatefulWidget {

  @override
  State<WebViewEx> createState() => _WebViewExState();
}

class _WebViewExState extends State<WebViewEx> {
  late WebViewController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My WebView"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
