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
  /// Set the [fetchTimeout] to specify the custom expiration
  /// duration time for any fetch from the Firebase Remote Config server.
  /// Server fetch will only be done when the previous fetch is already
  /// expired. Default expiration duration is 1 minute.
  ///
  /// Set the [minimumFetchInterval] to specify the maximum age
  /// of a cached config before it is considered stale.
  /// Defaults to five hours.
  FirebaseFeatureConfig({
    required List<Feature> features,
    Duration? fetchTimeout,
    Duration? minimumFetchInterval,
    this.onError,
  }) {
    _features = features
        .asMap()
        .map((_, feature) => MapEntry(feature.key, feature))
        .toIMap();
    _featuresController.add(_features);

    _fetchTimeout = fetchTimeout ?? const Duration(minutes: 1);
    _minimumFetchInterval = minimumFetchInterval ?? const Duration(hours: 5);
  }

  /// The status flag of available features.
  ///
  /// Consider that default values set to this variable will be used as feature
  /// flag default values.
  /// Default values will be used when the app launches for the first time so
  /// that there is no feature flag data yet on Firebase Remote Config's local
  /// cache.
  final _featuresController =
      StreamController<IMap<String, Feature>>.broadcast();
  late IMap<String, Feature> _features;

  IMap<String, Feature> get features => _features;

  Stream<IMap<String, Feature>> get featuresConfig =>
      _featuresController.stream;

  late final FirebaseRemoteConfig _remoteConfig;
  late final Duration _fetchTimeout;
  late final Duration _minimumFetchInterval;

  final void Function(Object error, StackTrace stackTrace)? onError;

  /// Initialize feature flag stream.
  ///
  /// The stream will be initialized with value from local stored feature
  /// status (or default feature status if there's no local cache yet).
  /// Then it will fetch the feature status configuration from Firebase
  /// Remote Config server and store the latest config to the local cache and
  /// to the stream.
  StreamSubscription<RemoteConfigUpdate>? _remoteConfigUpdateSub;

  Future<void> start() async {
    try {
      _remoteConfig = FirebaseRemoteConfig.instance;

      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        minimumFetchInterval: _minimumFetchInterval,
        fetchTimeout: _fetchTimeout,
      ));

      // Initial fetch
      await fetchAndUpdate();

      // Real-time updates
      listenForConfigUpdates();

      // Activate real-time updates
      await _remoteConfig.activate();
    } catch (e, s) {
      onError?.call(e, s);
    }
  }

  void stopListeningForConfigUpdates() {
    _remoteConfigUpdateSub?.cancel();
    _remoteConfigUpdateSub = null;
  }

  void listenForConfigUpdates() {
    try {
      stopListeningForConfigUpdates();

      _remoteConfigUpdateSub = _remoteConfig.onConfigUpdated.listen(
        (RemoteConfigUpdate update) async {
          try {
            await _remoteConfig.activate();
            final updated = <String, Feature>{};
            for (final key in update.updatedKeys) {
              if (_features.containsKey(key)) {
                updated[key] = Feature(
                  key: key,
                  boolValue: _remoteConfig.getBool(key),
                  stringValue: _remoteConfig.getString(key),
                );
              }
            }
            if (updated.isNotEmpty) {
              _features = _features.addMap(updated);
              _featuresController.add(_features);
            }
          } catch (e, s) {
            onError?.call(e, s);
          }
        },
        onError: (Object e, StackTrace s) {
          onError?.call(e, s);
        },
      );
    } catch (e, s) {
      onError?.call(e, s);
    }
  }

  Future<IMap<String, Feature>> fetchAndUpdate() async {
    try {
      await _remoteConfig.fetchAndActivate();

      final updated = _features.map((key, feature) {
        return MapEntry(
          key,
          _remoteConfig.getAll().containsKey(key)
              ? feature.copyWith(
                  boolValue: _remoteConfig.getBool(key),
                  stringValue: _remoteConfig.getString(key),
                )
              : feature,
        );
      });

      _features = updated;
      _featuresController.add(_features);
    } catch (e, s) {
      onError?.call(e, s);
    }
    return _features;
  }

  bool isEnable(String key) => _features[key]?.boolValue ?? false;

  void close() {
    stopListeningForConfigUpdates();
    _featuresController.close();
  }
}
