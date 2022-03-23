import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      body: MPWebView(
        url: 'https://www.zxzjtv.com//video/3667-1-1.html',
        controller: MPWebViewController(),
      ),
    );
  }
}
