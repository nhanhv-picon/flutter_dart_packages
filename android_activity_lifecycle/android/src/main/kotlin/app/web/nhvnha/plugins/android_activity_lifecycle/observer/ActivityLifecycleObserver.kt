package app.web.nhvnha.plugins.android_activity_lifecycle.observer

import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.LifecycleOwner
import io.flutter.plugin.common.MethodChannel
import java.util.Date

class ActivityLifecycleObserver(val methodChannel: MethodChannel) : DefaultLifecycleObserver {
    override fun onCreate(owner: LifecycleOwner) {
        super.onCreate(owner)
        methodChannel.invokeMethod("onCreate", Date().toString())
    }

    override fun onStart(owner: LifecycleOwner) {
        super.onStart(owner)
        methodChannel.invokeMethod("onStart", Date().toString())
    }

    override fun onResume(owner: LifecycleOwner) {
        super.onResume(owner)
        methodChannel.invokeMethod("onResume", Date().toString())
    }

    override fun onPause(owner: LifecycleOwner) {
        super.onPause(owner)
        methodChannel.invokeMethod("onPause", Date().toString())
    }

    override fun onStop(owner: LifecycleOwner) {
        super.onStop(owner)
        methodChannel.invokeMethod("onStop", Date().toString())
    }

    override fun onDestroy(owner: LifecycleOwner) {
        super.onDestroy(owner)
        methodChannel.invokeMethod("onDestroy", Date().toString())
    }
}