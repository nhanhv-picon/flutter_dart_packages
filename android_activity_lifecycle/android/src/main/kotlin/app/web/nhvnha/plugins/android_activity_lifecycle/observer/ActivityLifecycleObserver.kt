package app.web.nhvnha.plugins.android_activity_lifecycle.observer

import ActivityLifeCycleStateEnum
import MessageFlutterApi
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.LifecycleOwner
import io.flutter.embedding.engine.plugins.FlutterPlugin

class ActivityLifecycleObserver(val flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) :
    DefaultLifecycleObserver {
    var flutterApi: MessageFlutterApi? = null

    init {
        flutterApi = MessageFlutterApi(flutterPluginBinding.getBinaryMessenger())
    }

    fun callFlutterMethodOnActivityLifeCycleState(state: ActivityLifeCycleStateEnum) {
        flutterApi!!.onActivityLifeCycleState(state) {}
    }

    override fun onCreate(owner: LifecycleOwner) {
        super.onCreate(owner)
        callFlutterMethodOnActivityLifeCycleState(ActivityLifeCycleStateEnum.ONCREATE)
    }

    override fun onStart(owner: LifecycleOwner) {
        super.onStart(owner)
        callFlutterMethodOnActivityLifeCycleState(ActivityLifeCycleStateEnum.ONSTART)
    }

    override fun onResume(owner: LifecycleOwner) {
        super.onResume(owner)
        callFlutterMethodOnActivityLifeCycleState(ActivityLifeCycleStateEnum.ONRESUME)
    }

    override fun onPause(owner: LifecycleOwner) {
        super.onPause(owner)
        callFlutterMethodOnActivityLifeCycleState(ActivityLifeCycleStateEnum.ONPAUSE)
    }

    override fun onStop(owner: LifecycleOwner) {
        super.onStop(owner)
        callFlutterMethodOnActivityLifeCycleState(ActivityLifeCycleStateEnum.ONSTOP)
    }

    override fun onDestroy(owner: LifecycleOwner) {
        super.onDestroy(owner)
        callFlutterMethodOnActivityLifeCycleState(ActivityLifeCycleStateEnum.ONDESTROY)
    }
}