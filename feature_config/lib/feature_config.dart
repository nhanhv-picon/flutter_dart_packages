library feature_config;

import 'package:feature_config/feature_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'business.dart';
export 'presentation.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final firebaseFeatureConfig = FirebaseFeatureConfig(
    features: [
      const Feature(key: 'CHAT_ENABLE_REACTION', isEnabled: true),
    ],
  );

  @override
  void initState() {
    firebaseFeatureConfig.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeatureConfigBloc>(
      create: (context) => FeatureConfigBloc(
        featureConfigs: firebaseFeatureConfig.featuresConfig,
      ),
      child: Builder(
        builder: (context) {
          return FeatureConfigContainer(
            featureKey: 'CHAT_ENABLE_REACTION',
            builder: (context, isEnabled) {
              return Text('CHAT_ENABLE_REACTION = $isEnabled');
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    firebaseFeatureConfig.close();
    super.dispose();
  }
}
