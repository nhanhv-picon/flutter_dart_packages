import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_activity_lifecycle_method_channel.dart';

abstract class AndroidActivityLifecyclePlatform extends PlatformInterface {
  /// Constructs a AndroidActivityLifecyclePlatform.
  AndroidActivityLifecyclePlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidActivityLifecyclePlatform _instance =
      MethodChannelAndroidActivityLifecycle();

  /// The default instance of [AndroidActivityLifecyclePlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidActivityLifecycle].
  static AndroidActivityLifecyclePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidActivityLifecyclePlatform] when
  /// they register themselves.
  static set instance(AndroidActivityLifecyclePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  void setMethodCallHandler(
      Future<dynamic> Function(MethodCall call)? handler) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
