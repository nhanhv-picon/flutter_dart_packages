import 'package:flutter/src/services/message_codec.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_activity_lifecycle/android_activity_lifecycle.dart';
import 'package:android_activity_lifecycle/android_activity_lifecycle_platform_interface.dart';
import 'package:android_activity_lifecycle/android_activity_lifecycle_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidActivityLifecyclePlatform
    with MockPlatformInterfaceMixin
    implements AndroidActivityLifecyclePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  void setMethodCallHandler(Future Function(MethodCall call)? handler) {
    // TODO: implement setMethodCallHandler
  }
}

void main() {
  final AndroidActivityLifecyclePlatform initialPlatform =
      AndroidActivityLifecyclePlatform.instance;

  test('$MethodChannelAndroidActivityLifecycle is the default instance', () {
    expect(
        initialPlatform, isInstanceOf<MethodChannelAndroidActivityLifecycle>());
  });

  test('getPlatformVersion', () async {
    AndroidActivityLifecycle androidActivityLifecyclePlugin =
        AndroidActivityLifecycle();
    MockAndroidActivityLifecyclePlatform fakePlatform =
        MockAndroidActivityLifecyclePlatform();
    AndroidActivityLifecyclePlatform.instance = fakePlatform;

    //expect(await androidActivityLifecyclePlugin.getPlatformVersion(), '42');
  });
}
