part of 'riverpod.dart';

@freezed
abstract class FeatureConfigState with _$FeatureConfigState {
  const factory FeatureConfigState({
    @Default(IMap.empty()) IMap<String, Feature> features,
  }) = _FeatureConfigState;
}

extension FeatureConfigStateExt on FeatureConfigState {
  bool isEnabled(String key) {
    return features[key]?.boolValue ?? false;
  }
}

@Riverpod()
class FeatureConfigRiverpod extends _$FeatureConfigRiverpod {
  late StreamSubscription<IMap<String, Feature>> _subscription;

  @override
  FeatureConfigState build() {
    // Initialize the stream
    final featureStream = ref.read(abstractFeatureConfigStreamProvider);

    _subscription = featureStream.listen((features) {
      state = state.copyWith(features: features);
    });

    ref.onDispose(() {
      _subscription.cancel();
    });

    return const FeatureConfigState();
  }
}
