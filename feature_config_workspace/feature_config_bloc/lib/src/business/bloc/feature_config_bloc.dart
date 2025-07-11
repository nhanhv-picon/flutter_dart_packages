import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:feature_config/business.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_config_bloc.freezed.dart';
part 'feature_config_event.dart';
part 'feature_config_state.dart';

class FeatureConfigBloc extends Bloc<FeatureConfigEvent, FeatureConfigState> {
  late StreamSubscription<IMap<String, Feature>> streamSubscription;

  FeatureConfigBloc({
    required Stream<IMap<String, Feature>> featureConfigs,
  }) : super(const FeatureConfigState()) {
    on<SetFeatureConfigsFeatureConfigEvent>(_setFeatureConfigs);

    streamSubscription = featureConfigs.listen((features) {
      add(SetFeatureConfigsFeatureConfigEvent(features: features));
    });
  }

  FutureOr<void> _setFeatureConfigs(
    SetFeatureConfigsFeatureConfigEvent event,
    Emitter<FeatureConfigState> emit,
  ) {
    emit(state.copyWith(features: event.features));
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
