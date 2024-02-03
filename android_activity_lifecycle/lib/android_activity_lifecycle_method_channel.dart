import 'dart:async';

import 'package:android_activity_lifecycle/src/messages/messages.g.dart';

import 'android_activity_lifecycle_platform_interface.dart';

/// An implementation of [AndroidActivityLifecyclePlatform] that uses method channels.
class MethodChannelAndroidActivityLifecycle
    extends AndroidActivityLifecyclePlatform {
  final _stateStreamController =
      StreamController<ActivityLifeCycleStateEnum>.broadcast();

  MethodChannelAndroidActivityLifecycle() {
    MessageFlutterApi.setup(this);
  }

  @override
  void onActivityLifeCycleState(ActivityLifeCycleStateEnum state) {
    _stateStreamController.sink.add(state);
  }

  @override
  Stream<ActivityLifeCycleStateEnum> get stateStream =>
      _stateStreamController.stream;
}
