// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// launch url in webview
// Import necessary packages
import 'package:webview_flutter/webview_flutter.dart';

// Define the function to launch URL in webview
Future launchURLInWebView(
    BuildContext context, Color backgroundColor, Color progressColor) async {
  String uri = "https://monosnap.com/file/rAJcNJVnKzy3Gcgk6mXPZWZzIMsgaH";
  // Create a new webview instance
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(backgroundColor)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          Center(child: CircularProgressIndicator(color: progressColor));
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(uri));

  // Show the webview in a dialog
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: WebViewWidget(controller: controller),
        ),
        actions: <Widget>[
          InkWell(
            child: Text('Close'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
