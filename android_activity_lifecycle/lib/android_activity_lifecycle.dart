import 'package:flutter/services.dart';

import 'android_activity_lifecycle_platform_interface.dart';

class AndroidActivityLifecycle {
  void setMethodCallHandler(
      Future<dynamic> Function(MethodCall call)? handler) {
    AndroidActivityLifecyclePlatform.instance.setMethodCallHandler(handler);
  }
}
