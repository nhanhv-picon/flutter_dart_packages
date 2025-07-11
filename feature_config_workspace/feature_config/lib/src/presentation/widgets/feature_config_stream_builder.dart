import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:feature_config/feature_config.dart';
import 'package:flutter/material.dart';

class FeatureConfigStreamBuilder extends StatelessWidget {
  const FeatureConfigStreamBuilder({
    super.key,
    required this.featureKey,
    required this.stream,
    required this.builder,
  });

  final String featureKey;
  final Stream<IMap<String, Feature>> stream;
  final Widget Function(
    BuildContext context,
    Feature feature,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<IMap<String, Feature>>(
      stream: stream,
      builder: (BuildContext context,
          AsyncSnapshot<IMap<String, Feature>> snapshot) {
        if (snapshot.hasData) {
          return builder(
              context, snapshot.data?[featureKey] ?? Feature(key: featureKey));
        }
        return builder(context, Feature(key: featureKey));
      },
    );
  }
}
