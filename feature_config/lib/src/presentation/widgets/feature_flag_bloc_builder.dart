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
  final BlocWidgetBuilder<bool> builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FeatureConfigBloc, FeatureConfigState, bool>(
      selector: (state) {
        return state.isEnable(featureKey);
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
  final BlocWidgetBuilder<bool> builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FeatureConfigBloc, FeatureConfigState, bool>(
      selector: (state) {
        return !featureKeySet
            .map((key) => state.isEnable(key))
            .contains(false);
      },
      builder: builder,
    );
  }
}
