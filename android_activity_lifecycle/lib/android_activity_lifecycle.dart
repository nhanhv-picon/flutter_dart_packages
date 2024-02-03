
import 'android_activity_lifecycle_platform_interface.dart';

class AndroidActivityLifecycle {
  Future<String?> getPlatformVersion() {
    return AndroidActivityLifecyclePlatform.instance.getPlatformVersion();
  }
}
