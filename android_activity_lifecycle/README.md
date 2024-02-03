# android_activity_lifecycle

Android activity lifecycle observer
<p align="center">
  <a href="https://pub.dev/packages/android_activity_lifecycle"><img src="https://img.shields.io/pub/v/android_activity_lifecycle.svg" alt="pub.dev"></a>
  <a href="https://github.com/nguyenhoangvannha/android_activity_lifecycle"><img src="https://img.shields.io/badge/platform-flutter-ff69b4.svg" alt="github"></a>
  <a href="https://coveralls.io/github/nguyenhoangvannha/android_activity_lifecycle"><img src="https://coveralls.io/repos/github/nguyenhoangvannha/android_activity_lifecycle/badge.svg?branch=master" alt="coverage"></a>
  <a href="https://pub.dev/packages/android_activity_lifecycle/score"><img src="https://img.shields.io/pub/likes/android_activity_lifecycle.svg" alt="likes"></a>
  <a href="https://pub.dev/packages/android_activity_lifecycle/score"><img src="https://img.shields.io/pub/popularity/android_activity_lifecycle.svg" alt="popularity"></a>
  <a href="https://codemagic.io/apps/5db10f597d3edb001a6ede16/5db10f597d3edb001a6ede15/latest_build"><img src="https://api.codemagic.io/apps/5db10f597d3edb001a6ede16/5db10f597d3edb001a6ede15/status_badge.svg" alt="build status"></a>
  <a href="https://github.com/nguyenhoangvannha/android_activity_lifecycle/raw/LICENSE"><img src="https://img.shields.io/github/license/nguyenhoangvannha/android_activity_lifecycle.svg" alt="license"></a>
</p>

Example:

```dart
final _nAndroidLifecyclePlugin = AndroidActivityLifecycle();

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
```