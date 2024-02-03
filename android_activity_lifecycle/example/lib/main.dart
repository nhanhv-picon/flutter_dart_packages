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
    _nAndroidLifecyclePlugin.stateStream.listen((event) {
      final message = "ActivityLifeCycleState = $event";
      log(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              StreamBuilder<ActivityLifeCycleStateEnum>(
                stream: _nAndroidLifecyclePlugin.stateStream,
                builder: (_, s) {
                  final message = "ActivityLifeCycleState = ${s.data}";
                  return Text(message);
                },
              ),
              const Text('Open logging for more information\n'),
            ],
          ),
        ),
      ),
    );
  }
}
