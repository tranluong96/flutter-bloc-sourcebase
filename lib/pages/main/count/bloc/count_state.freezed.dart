// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'count_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CountState {

 CountStatus get status; int get count; Object? get error;
/// Create a copy of CountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountStateCopyWith<CountState> get copyWith => _$CountStateCopyWithImpl<CountState>(this as CountState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountState&&(identical(other.status, status) || other.status == status)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,status,count,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'CountState(status: $status, count: $count, error: $error)';
}


}

/// @nodoc
abstract mixin class $CountStateCopyWith<$Res>  {
  factory $CountStateCopyWith(CountState value, $Res Function(CountState) _then) = _$CountStateCopyWithImpl;
@useResult
$Res call({
 CountStatus status, int count, Object? error
});




}
/// @nodoc
class _$CountStateCopyWithImpl<$Res>
    implements $CountStateCopyWith<$Res> {
  _$CountStateCopyWithImpl(this._self, this._then);

  final CountState _self;
  final $Res Function(CountState) _then;

/// Create a copy of CountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? count = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CountStatus,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [CountState].
extension CountStatePatterns on CountState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountState value)  $default,){
final _that = this;
switch (_that) {
case _CountState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountState value)?  $default,){
final _that = this;
switch (_that) {
case _CountState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CountStatus status,  int count,  Object? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountState() when $default != null:
return $default(_that.status,_that.count,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CountStatus status,  int count,  Object? error)  $default,) {final _that = this;
switch (_that) {
case _CountState():
return $default(_that.status,_that.count,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CountStatus status,  int count,  Object? error)?  $default,) {final _that = this;
switch (_that) {
case _CountState() when $default != null:
return $default(_that.status,_that.count,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CountState extends CountState {
   _CountState({required this.status, required this.count, this.error}): super._();
  

@override final  CountStatus status;
@override final  int count;
@override final  Object? error;

/// Create a copy of CountState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountStateCopyWith<_CountState> get copyWith => __$CountStateCopyWithImpl<_CountState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountState&&(identical(other.status, status) || other.status == status)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,status,count,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'CountState(status: $status, count: $count, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CountStateCopyWith<$Res> implements $CountStateCopyWith<$Res> {
  factory _$CountStateCopyWith(_CountState value, $Res Function(_CountState) _then) = __$CountStateCopyWithImpl;
@override @useResult
$Res call({
 CountStatus status, int count, Object? error
});




}
/// @nodoc
class __$CountStateCopyWithImpl<$Res>
    implements _$CountStateCopyWith<$Res> {
  __$CountStateCopyWithImpl(this._self, this._then);

  final _CountState _self;
  final $Res Function(_CountState) _then;

/// Create a copy of CountState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? count = null,Object? error = freezed,}) {
  return _then(_CountState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CountStatus,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
