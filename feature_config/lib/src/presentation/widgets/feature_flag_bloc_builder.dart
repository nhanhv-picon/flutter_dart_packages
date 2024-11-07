import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:feature_config/feature_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureFlagBlocBuilder extends StatelessWidget {
  const FeatureFlagBlocBuilder({
    super.key,
    required this.featureKey,
    required this.builder,
  });

  final String featureKey;
  final Widget Function(BuildContext context, bool isEnabled) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FeatureConfigBloc, FeatureConfigState, bool>(
      selector: (state) {
        return state.isEnabled(featureKey);
      },
      builder: builder,
    );
  }
}

class MultiFeatureFlagBlocBuilder extends StatelessWidget {
  const MultiFeatureFlagBlocBuilder({
    super.key,
    required this.featureKeySet,
    required this.builder,
  });

  final Set<String> featureKeySet;
  final Widget Function(BuildContext context, bool isEnabled) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FeatureConfigBloc, FeatureConfigState, bool>(
      selector: (state) {
        return !featureKeySet
            .map((key) => state.isEnabled(key))
            .contains(false);
      },
      builder: builder,
    );
  }
}

class MultiFeaturesBlocBuilder extends StatelessWidget {
  const MultiFeaturesBlocBuilder({
    super.key,
    required this.featureKeys,
    required this.builder,
  });

  final Set<String> featureKeys;
  final Widget Function(BuildContext context, IMap<String, Feature?> features)
      builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FeatureConfigBloc, FeatureConfigState,
        IMap<String, Feature?>>(
      selector: (state) {
        return featureKeys
            .toList()
            .asMap()
            .map((_, featureKey) =>
                MapEntry(featureKey, state.features.get(featureKey)))
            .toIMap();
      },
      builder: builder,
    );
  }
}
