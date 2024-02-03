import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/messages/messages.g.dart',
  dartOptions: DartOptions(),
  kotlinOut:'android/src/main/kotlin/app/web/nhvnha/plugins/android_activity_lifecycle/messages/Messages.g.kt',
  kotlinOptions: KotlinOptions(),
  copyrightHeader: 'pigeons/copyright.txt',
  dartPackageName: 'android_activity_lifecycle',
))

enum ActivityLifeCycleStateEnum {
  onCreate,
  onStart,
  onResume,
  onPause,
  onStop,
  onRestart,
  onDestroy,
}

@FlutterApi()
abstract class MessageFlutterApi {
  void onActivityLifeCycleState(ActivityLifeCycleStateEnum state);
}