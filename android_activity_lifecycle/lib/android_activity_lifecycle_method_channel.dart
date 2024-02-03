import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_activity_lifecycle_platform_interface.dart';

/// An implementation of [AndroidActivityLifecyclePlatform] that uses method channels.
class MethodChannelAndroidActivityLifecycle
    extends AndroidActivityLifecyclePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_activity_lifecycle');

  @override
  void setMethodCallHandler(Future Function(MethodCall call)? handler) {
    methodChannel.setMethodCallHandler(handler);
  }
}
