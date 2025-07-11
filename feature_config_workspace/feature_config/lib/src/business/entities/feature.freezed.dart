// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Feature _$FeatureFromJson(Map<String, dynamic> json) {
  return _Feature.fromJson(json);
}

/// @nodoc
mixin _$Feature {
  @JsonKey(name: 'key')
  String get key => throw _privateConstructorUsedError;
  @JsonKey(name: 'boolean')
  bool get boolValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'string')
  String get stringValue => throw _privateConstructorUsedError;

  /// Serializes this Feature to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Feature
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeatureCopyWith<Feature> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureCopyWith<$Res> {
  factory $FeatureCopyWith(Feature value, $Res Function(Feature) then) =
      _$FeatureCopyWithImpl<$Res, Feature>;
  @useResult
  $Res call(
      {@JsonKey(name: 'key') String key,
      @JsonKey(name: 'boolean') bool boolValue,
      @JsonKey(name: 'string') String stringValue});
}

/// @nodoc
class _$FeatureCopyWithImpl<$Res, $Val extends Feature>
    implements $FeatureCopyWith<$Res> {
  _$FeatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Feature
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? boolValue = null,
    Object? stringValue = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      boolValue: null == boolValue
          ? _value.boolValue
          : boolValue // ignore: cast_nullable_to_non_nullable
              as bool,
      stringValue: null == stringValue
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureImplCopyWith<$Res> implements $FeatureCopyWith<$Res> {
  factory _$$FeatureImplCopyWith(
          _$FeatureImpl value, $Res Function(_$FeatureImpl) then) =
      __$$FeatureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'key') String key,
      @JsonKey(name: 'boolean') bool boolValue,
      @JsonKey(name: 'string') String stringValue});
}

/// @nodoc
class __$$FeatureImplCopyWithImpl<$Res>
    extends _$FeatureCopyWithImpl<$Res, _$FeatureImpl>
    implements _$$FeatureImplCopyWith<$Res> {
  __$$FeatureImplCopyWithImpl(
      _$FeatureImpl _value, $Res Function(_$FeatureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Feature
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? boolValue = null,
    Object? stringValue = null,
  }) {
    return _then(_$FeatureImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      boolValue: null == boolValue
          ? _value.boolValue
          : boolValue // ignore: cast_nullable_to_non_nullable
              as bool,
      stringValue: null == stringValue
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureImpl implements _Feature {
  const _$FeatureImpl(
      {@JsonKey(name: 'key') this.key = '',
      @JsonKey(name: 'boolean') this.boolValue = false,
      @JsonKey(name: 'string') this.stringValue = ''});

  factory _$FeatureImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureImplFromJson(json);

  @override
  @JsonKey(name: 'key')
  final String key;
  @override
  @JsonKey(name: 'boolean')
  final bool boolValue;
  @override
  @JsonKey(name: 'string')
  final String stringValue;

  @override
  String toString() {
    return 'Feature(key: $key, boolValue: $boolValue, stringValue: $stringValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.boolValue, boolValue) ||
                other.boolValue == boolValue) &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, boolValue, stringValue);

  /// Create a copy of Feature
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureImplCopyWith<_$FeatureImpl> get copyWith =>
      __$$FeatureImplCopyWithImpl<_$FeatureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureImplToJson(
      this,
    );
  }
}

abstract class _Feature implements Feature {
  const factory _Feature(
      {@JsonKey(name: 'key') final String key,
      @JsonKey(name: 'boolean') final bool boolValue,
      @JsonKey(name: 'string') final String stringValue}) = _$FeatureImpl;

  factory _Feature.fromJson(Map<String, dynamic> json) = _$FeatureImpl.fromJson;

  @override
  @JsonKey(name: 'key')
  String get key;
  @override
  @JsonKey(name: 'boolean')
  bool get boolValue;
  @override
  @JsonKey(name: 'string')
  String get stringValue;

  /// Create a copy of Feature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeatureImplCopyWith<_$FeatureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
