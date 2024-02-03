import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:android_activity_lifecycle/android_activity_lifecycle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _nAndroidLifecyclePlugin = AndroidActivityLifecycle();

  @override
  void initState() {
    super.initState();
    _nAndroidLifecyclePlugin.setMethodCallHandler((call) async {
      String message = "Unknown";
      bool result = true;
      switch (call.method) {
        case "onCreate":
          message = ("dart ${call.method} ${call.arguments}");
          break;
        case "onStart":
          message = ("dart ${call.method} ${call.arguments}");
          break;
        case "onResume":
          message = ("dart ${call.method} ${call.arguments}");
          break;
        case "onPause":
          message = ("dart ${call.method} ${call.arguments}");
          break;
        case "onStop":
          message = ("dart ${call.method} ${call.arguments}");
          break;
        case "onDestroy":
          message = ("dart ${call.method} ${call.arguments}");
          break;
        default:
          result = false;
      }
      log(message);
      return result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Column(
            children: [
              Text('Open logging for more information\n'),
            ],
          ),
        ),
      ),
    );
  }
}
