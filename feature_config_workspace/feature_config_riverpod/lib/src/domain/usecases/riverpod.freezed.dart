// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'riverpod.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeatureConfigState {

 IMap<String, Feature> get features;
/// Create a copy of FeatureConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureConfigStateCopyWith<FeatureConfigState> get copyWith => _$FeatureConfigStateCopyWithImpl<FeatureConfigState>(this as FeatureConfigState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureConfigState&&(identical(other.features, features) || other.features == features));
}


@override
int get hashCode => Object.hash(runtimeType,features);

@override
String toString() {
  return 'FeatureConfigState(features: $features)';
}


}

/// @nodoc
abstract mixin class $FeatureConfigStateCopyWith<$Res>  {
  factory $FeatureConfigStateCopyWith(FeatureConfigState value, $Res Function(FeatureConfigState) _then) = _$FeatureConfigStateCopyWithImpl;
@useResult
$Res call({
 IMap<String, Feature> features
});




}
/// @nodoc
class _$FeatureConfigStateCopyWithImpl<$Res>
    implements $FeatureConfigStateCopyWith<$Res> {
  _$FeatureConfigStateCopyWithImpl(this._self, this._then);

  final FeatureConfigState _self;
  final $Res Function(FeatureConfigState) _then;

/// Create a copy of FeatureConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? features = null,}) {
  return _then(_self.copyWith(
features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as IMap<String, Feature>,
  ));
}

}


/// Adds pattern-matching-related methods to [FeatureConfigState].
extension FeatureConfigStatePatterns on FeatureConfigState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeatureConfigState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeatureConfigState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeatureConfigState value)  $default,){
final _that = this;
switch (_that) {
case _FeatureConfigState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeatureConfigState value)?  $default,){
final _that = this;
switch (_that) {
case _FeatureConfigState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IMap<String, Feature> features)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeatureConfigState() when $default != null:
return $default(_that.features);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IMap<String, Feature> features)  $default,) {final _that = this;
switch (_that) {
case _FeatureConfigState():
return $default(_that.features);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IMap<String, Feature> features)?  $default,) {final _that = this;
switch (_that) {
case _FeatureConfigState() when $default != null:
return $default(_that.features);case _:
  return null;

}
}

}

/// @nodoc


class _FeatureConfigState implements FeatureConfigState {
  const _FeatureConfigState({this.features = const IMap.empty()});
  

@override@JsonKey() final  IMap<String, Feature> features;

/// Create a copy of FeatureConfigState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeatureConfigStateCopyWith<_FeatureConfigState> get copyWith => __$FeatureConfigStateCopyWithImpl<_FeatureConfigState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeatureConfigState&&(identical(other.features, features) || other.features == features));
}


@override
int get hashCode => Object.hash(runtimeType,features);

@override
String toString() {
  return 'FeatureConfigState(features: $features)';
}


}

/// @nodoc
abstract mixin class _$FeatureConfigStateCopyWith<$Res> implements $FeatureConfigStateCopyWith<$Res> {
  factory _$FeatureConfigStateCopyWith(_FeatureConfigState value, $Res Function(_FeatureConfigState) _then) = __$FeatureConfigStateCopyWithImpl;
@override @useResult
$Res call({
 IMap<String, Feature> features
});




}
/// @nodoc
class __$FeatureConfigStateCopyWithImpl<$Res>
    implements _$FeatureConfigStateCopyWith<$Res> {
  __$FeatureConfigStateCopyWithImpl(this._self, this._then);

  final _FeatureConfigState _self;
  final $Res Function(_FeatureConfigState) _then;

/// Create a copy of FeatureConfigState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? features = null,}) {
  return _then(_FeatureConfigState(
features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as IMap<String, Feature>,
  ));
}


}

// dart format on
