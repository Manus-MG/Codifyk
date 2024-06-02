import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({super.key});

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse('https://embed.coderpad.io/sandbox?question_id=247188&use_question_button&_gl=1*ygc416*_ga*MjA2MjQxODU5OC4xNzE3MzI1MDY1*_ga_XBQ5N5CE2N*MTcxNzMyNTA2NS4xLjEuMTcxNzMyNTMxMS42MC4wLjA.*_gcl_au*NDI4ODg5NzgxLjE3MTczMjUwNjY.'),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.2,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal.shade700,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => {},
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
              color: Colors.orange,
            ),
        ],
      ),
    );
  }
}