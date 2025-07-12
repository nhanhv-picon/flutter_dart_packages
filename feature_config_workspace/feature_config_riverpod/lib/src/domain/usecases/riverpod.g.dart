// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(FeatureConfigRiverpod)
const featureConfigRiverpodProvider = FeatureConfigRiverpodProvider._();

final class FeatureConfigRiverpodProvider
    extends $NotifierProvider<FeatureConfigRiverpod, FeatureConfigState> {
  const FeatureConfigRiverpodProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'featureConfigRiverpodProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$featureConfigRiverpodHash();

  @$internal
  @override
  FeatureConfigRiverpod create() => FeatureConfigRiverpod();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeatureConfigState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeatureConfigState>(value),
    );
  }
}

String _$featureConfigRiverpodHash() =>
    r'74837dd5fd64bc84e07c637f5f84380dcf88cee0';

abstract class _$FeatureConfigRiverpod extends $Notifier<FeatureConfigState> {
  FeatureConfigState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<FeatureConfigState, FeatureConfigState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FeatureConfigState, FeatureConfigState>,
              FeatureConfigState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(abstractFeatureConfigStream)
const abstractFeatureConfigStreamProvider =
    AbstractFeatureConfigStreamProvider._();

final class AbstractFeatureConfigStreamProvider
    extends
        $FunctionalProvider<
          Raw<Stream<IMap<String, Feature>>>,
          Raw<Stream<IMap<String, Feature>>>,
          Raw<Stream<IMap<String, Feature>>>
        >
    with $Provider<Raw<Stream<IMap<String, Feature>>>> {
  const AbstractFeatureConfigStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'abstractFeatureConfigStreamProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$abstractFeatureConfigStreamHash();

  @$internal
  @override
  $ProviderElement<Raw<Stream<IMap<String, Feature>>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Raw<Stream<IMap<String, Feature>>> create(Ref ref) {
    return abstractFeatureConfigStream(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Stream<IMap<String, Feature>>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Stream<IMap<String, Feature>>>>(
        value,
      ),
    );
  }
}

String _$abstractFeatureConfigStreamHash() =>
    r'06ab2b79f13cb54e21d6832e5adb2777496263cc';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
