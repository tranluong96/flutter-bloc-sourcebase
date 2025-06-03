// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'count_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CountState {
  CountStatus get status => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountStateCopyWith<CountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountStateCopyWith<$Res> {
  factory $CountStateCopyWith(
          CountState value, $Res Function(CountState) then) =
      _$CountStateCopyWithImpl<$Res, CountState>;
  @useResult
  $Res call({CountStatus status, int count, Object? error});
}

/// @nodoc
class _$CountStateCopyWithImpl<$Res, $Val extends CountState>
    implements $CountStateCopyWith<$Res> {
  _$CountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? count = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CountStatus,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountStateImplCopyWith<$Res>
    implements $CountStateCopyWith<$Res> {
  factory _$$CountStateImplCopyWith(
          _$CountStateImpl value, $Res Function(_$CountStateImpl) then) =
      __$$CountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CountStatus status, int count, Object? error});
}

/// @nodoc
class __$$CountStateImplCopyWithImpl<$Res>
    extends _$CountStateCopyWithImpl<$Res, _$CountStateImpl>
    implements _$$CountStateImplCopyWith<$Res> {
  __$$CountStateImplCopyWithImpl(
      _$CountStateImpl _value, $Res Function(_$CountStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? count = null,
    Object? error = freezed,
  }) {
    return _then(_$CountStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CountStatus,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$CountStateImpl extends _CountState {
  _$CountStateImpl({required this.status, required this.count, this.error})
      : super._();

  @override
  final CountStatus status;
  @override
  final int count;
  @override
  final Object? error;

  @override
  String toString() {
    return 'CountState(status: $status, count: $count, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, count, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountStateImplCopyWith<_$CountStateImpl> get copyWith =>
      __$$CountStateImplCopyWithImpl<_$CountStateImpl>(this, _$identity);
}

abstract class _CountState extends CountState {
  factory _CountState(
      {required final CountStatus status,
      required final int count,
      final Object? error}) = _$CountStateImpl;
  _CountState._() : super._();

  @override
  CountStatus get status;
  @override
  int get count;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$CountStateImplCopyWith<_$CountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
