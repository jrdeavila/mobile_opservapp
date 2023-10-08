import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CreatedBusinessScreen extends StatelessWidget {
  const CreatedBusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..clearCache()
      ..loadRequest(
        Uri.parse(
            'https://192.168.0.12/public/dashboard/c4df66e7-39e3-44d8-ac90-a50f5dc43973'),
      );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Created Business"),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
