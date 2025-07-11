import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:feature_config/business.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

/// App wide feature flag manager. Manages the availability status of each
/// features on the app.
class FirebaseFeatureConfig {
  /// Constructs an instance of [FirebaseFeatureConfig].
  ///
  /// Make sure you have set the required Firebase Remote Config setup on your
  /// app.
  ///
  /// Set the default values of feature flags to [features].
  ///
  /// Set the [fetchExpirationDuration] to specify the custom expiration
  /// duration time for any fetch from the Firebase Remote Config server.
  /// Server fetch will only be done when the previous fetch is already
  /// expired. Default expiration duration is 1 minute.
  ///
  /// Set the [fetchMaximumInterval] to specify the maximum age
  /// of a cached config before it is considered stale.
  /// Defaults to five hours.
  FirebaseFeatureConfig({
    required List<Feature> features,
    Duration? fetchExpirationDuration,
    Duration? fetchMaximumInterval,
    this.onError,
  }) {
    _features = features
        .asMap()
        .map((key, value) => MapEntry(value.key, value))
        .toIMap();
    _featuresStream.add(_features);
    _fetchExpirationDuration =
        fetchExpirationDuration ?? const Duration(minutes: 1);
    _fetchMaximumInterval = fetchMaximumInterval ?? const Duration(hours: 5);
  }

  /// The status flag of available features.
  ///
  /// Consider that default values set to this variable will be used as feature
  /// flag default values.
  /// Default values will be used when the app launches for the first time so
  /// that there is no feature flag data yet on Firebase Remote Config's local
  /// cache.
  final _featuresStream = StreamController<IMap<String, Feature>>();
  late IMap<String, Feature> _features;

  Stream<IMap<String, Feature>> get featuresConfig =>
      _featuresStream.stream.asBroadcastStream();

  late StreamSubscription<RemoteConfigUpdate> _remoteConfigUpdateSub;

  late FirebaseRemoteConfig _remoteConfig;
  late Duration _fetchExpirationDuration;
  late Duration _fetchMaximumInterval;

  final void Function(Object error, StackTrace stackTrace)? onError;

  /// Initialize feature flag stream.
  ///
  /// The stream will be initialized with value from local stored feature
  /// status (or default feature status if there's no local cache yet).
  /// Then it will fetch the feature status configuration from Firebase
  /// Remote Config server and store the latest config to the local cache and
  /// to the stream.
  Future<void> start() async {
    _remoteConfig = FirebaseRemoteConfig.instance;

    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      minimumFetchInterval: _fetchMaximumInterval,
      fetchTimeout: _fetchExpirationDuration,
    ));

    _remoteConfigUpdateSub = _remoteConfig.onConfigUpdated.listen(
      (event) async {
        try {
          await _remoteConfig.fetch();
          await _remoteConfig.fetchAndActivate();
          final updatedFeatures = <String, Feature>{};
          for (var key in event.updatedKeys) {
            if (_features.keys.contains(key)) {
              updatedFeatures[key] = Feature(
                key: key,
                boolValue: _remoteConfig.getBool(key),
                stringValue: _remoteConfig.getString(key),
              );
            }
          }
          _features = _features.addMap(updatedFeatures);
          _featuresStream.add(_features);
        } catch (e, s) {
          onError?.call(e, s);
        }
      },
    );
    await getFeatureConfig();
  }

  Future<IMap<String, Feature>> getFeatureConfig() async {
    try {
      ///1. Fetch the feature flag data from Firebase Remote Config server.
      await _remoteConfig.fetch();

      ///2. Store the fetched feature flag data to Firebase Remote Config local
      ///   cache.
      await _remoteConfig.fetchAndActivate();

      final remoteConfigKeys = _remoteConfig.getAll().keys;
      _features = _features.map(
        (key, feature) {
          return MapEntry<String, Feature>(
            key,
            remoteConfigKeys.contains(key)
                ? feature.copyWith(
                    boolValue: _remoteConfig.getBool(key),
                    stringValue: _remoteConfig.getString(key),
                  )
                : feature,
          );
        },
      );
      _featuresStream.add(_features);
    } catch (e, s) {
      onError?.call(e, s);
    }

    return _features;
  }

  bool isEnable(String featureFlagKey) {
    return _features[featureFlagKey]?.boolValue ?? false;
  }

  void close() {
    _remoteConfigUpdateSub.cancel();
    _featuresStream.close();
  }
}
