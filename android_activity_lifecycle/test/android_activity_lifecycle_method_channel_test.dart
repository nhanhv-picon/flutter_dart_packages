import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_activity_lifecycle/android_activity_lifecycle_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAndroidActivityLifecycle platform = MethodChannelAndroidActivityLifecycle();
  const MethodChannel channel = MethodChannel('android_activity_lifecycle');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
