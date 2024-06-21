import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Method channel
  static const platform = MethodChannel('launchUrl');

  const MyApp({super.key});

  // Method to open URL
  static Future<void> openUrl(String url) async {
    try {
      await platform.invokeMethod('openUrl', url);
    } on PlatformException catch (e) {
      print("Failed to open URL: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Platform Specific URL Launching")),
        body: Center(
          child: MaterialButton(
            onPressed: () {
              openUrl('https://www.youtube.com/@flutterdev');
            },
            color: Colors.blue, // Background color
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(color: Colors.blueAccent),
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 15.0, horizontal: 30.0), // Text color
            child: const Text('Open URL'),
          ),
        ),
      ),
      // ),
    );
  }
}
