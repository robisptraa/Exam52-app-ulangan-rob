import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

 void _secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

class WebviewPage extends StatefulWidget {
  final String url;
  const WebviewPage({super.key, required this.url});

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final controller = WebViewController();
 
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // masuk loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onHttpError: (HttpResponseError error) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        return NavigationDecision.navigate;
      }
    ),
  )
  ..loadRequest(Uri.parse(widget.url));
  _secureScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(title: Text('Exam52',  style: TextStyle( fontFamily: 'Raleway', // Custom font
            fontWeight: FontWeight.bold)
           ), backgroundColor: Colors.blueAccent ),

      body: WebViewWidget(controller: controller),
    );
  }
}