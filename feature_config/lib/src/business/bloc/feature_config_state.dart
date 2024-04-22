part of 'feature_config_bloc.dart';

@freezed
class FeatureConfigState with _$FeatureConfigState {
  const factory FeatureConfigState({
    @Default(IMap.empty()) IMap<String, Feature> features,
  }) = _FeatureConfigState;
}

extension FeatureConfigStateExt on FeatureConfigState {
  bool isEnabled(String key) {
    return features[key]?.isEnabled ?? false;
  }
}
