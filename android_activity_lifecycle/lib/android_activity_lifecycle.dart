import 'package:android_activity_lifecycle/src/messages/messages.g.dart';

import 'android_activity_lifecycle_platform_interface.dart';
export 'src/messages/messages.g.dart';

class AndroidActivityLifecycle {
  Stream<ActivityLifeCycleStateEnum> get stateStream =>
      AndroidActivityLifecyclePlatform.instance.stateStream;
}
