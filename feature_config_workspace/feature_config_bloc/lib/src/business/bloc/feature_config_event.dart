part of 'feature_config_bloc.dart';

sealed class FeatureConfigEvent {}

@freezed
class SetFeatureConfigsFeatureConfigEvent extends FeatureConfigEvent
    with _$SetFeatureConfigsFeatureConfigEvent {
  const factory SetFeatureConfigsFeatureConfigEvent({
    required IMap<String, Feature> features,
  }) = _SetFeatureConfigsFeatureConfigEvent;
}
