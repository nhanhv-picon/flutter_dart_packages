# android_activity_lifecycle

Android activity lifecycle observer

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