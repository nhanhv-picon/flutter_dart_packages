## Features

## Getting started

1. Config firebase_remote_config in your flutter app project
2. Add feature config key and value to firebase remote config
3. Add feature_config package

## Usage

```dart
import 'package:feature_config/feature_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final firebaseFeatureConfig = FirebaseFeatureConfig(
    features: [
      const Feature(key: 'CHAT_ENABLE_REACTION', boolValue: true),
    ],
  );

  @override
  void initState() {
    firebaseFeatureConfig.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider<FeatureConfigBloc>(
          create: (context) => FeatureConfigBloc(
            featureConfigs: firebaseFeatureConfig.featuresConfig,
          ),
          child: Builder(
            builder: (context) {
              return FeatureFlagBlocBuilder(
                featureKey: 'CHAT_ENABLE_REACTION',
                builder: (context, isEnabled) {
                  return Text('CHAT_ENABLE_REACTION = $isEnabled');
                },
              );
            },
          ),
        ),
        FeatureConfigStreamBuilder(
          featureKey: 'CHAT_ENABLE_REACTION',
          stream: firebaseFeatureConfig.featuresConfig,
          builder: (context, feature) {
            return Text('CHAT_ENABLE_REACTION = ${feature.isEnabled}');
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    firebaseFeatureConfig.close();
    super.dispose();
  }
}
```

## Additional information
