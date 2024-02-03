package app.web.nhvnha.plugins.android_activity_lifecycle

import androidx.lifecycle.Lifecycle
import app.web.nhvnha.plugins.android_activity_lifecycle.observer.ActivityLifecycleObserver
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.lifecycle.FlutterLifecycleAdapter
import io.flutter.plugin.common.MethodChannel

/** AndroidActivityLifecyclePlugin */
class AndroidActivityLifecyclePlugin: FlutterPlugin, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var activityLifeCycle: Lifecycle
  private lateinit var activityLifeCycleObserver: ActivityLifecycleObserver

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_activity_lifecycle")
    activityLifeCycleObserver = ActivityLifecycleObserver(flutterPluginBinding)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activityLifeCycle = FlutterLifecycleAdapter.getActivityLifecycle(binding)
    activityLifeCycle.addObserver(activityLifeCycleObserver)
  }

  override fun onDetachedFromActivityForConfigChanges() {
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
  }

  override fun onDetachedFromActivity() {
    activityLifeCycle.removeObserver(activityLifeCycleObserver)
  }
}
