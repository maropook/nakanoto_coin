// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'point_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PointStateTearOff {
  const _$PointStateTearOff();

  _PointState call({List<Point> points = const []}) {
    return _PointState(
      points: points,
    );
  }
}

/// @nodoc
const $PointState = _$PointStateTearOff();

/// @nodoc
mixin _$PointState {
  List<Point> get points => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PointStateCopyWith<PointState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointStateCopyWith<$Res> {
  factory $PointStateCopyWith(
          PointState value, $Res Function(PointState) then) =
      _$PointStateCopyWithImpl<$Res>;
  $Res call({List<Point> points});
}

/// @nodoc
class _$PointStateCopyWithImpl<$Res> implements $PointStateCopyWith<$Res> {
  _$PointStateCopyWithImpl(this._value, this._then);

  final PointState _value;
  // ignore: unused_field
  final $Res Function(PointState) _then;

  @override
  $Res call({
    Object? points = freezed,
  }) {
    return _then(_value.copyWith(
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>,
    ));
  }
}

/// @nodoc
abstract class _$PointStateCopyWith<$Res> implements $PointStateCopyWith<$Res> {
  factory _$PointStateCopyWith(
          _PointState value, $Res Function(_PointState) then) =
      __$PointStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Point> points});
}

/// @nodoc
class __$PointStateCopyWithImpl<$Res> extends _$PointStateCopyWithImpl<$Res>
    implements _$PointStateCopyWith<$Res> {
  __$PointStateCopyWithImpl(
      _PointState _value, $Res Function(_PointState) _then)
      : super(_value, (v) => _then(v as _PointState));

  @override
  _PointState get _value => super._value as _PointState;

  @override
  $Res call({
    Object? points = freezed,
  }) {
    return _then(_PointState(
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>,
    ));
  }
}

/// @nodoc

class _$_PointState implements _PointState {
  const _$_PointState({this.points = const []});

  @JsonKey(defaultValue: const [])
  @override
  final List<Point> points;

  @override
  String toString() {
    return 'PointState(points: $points)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PointState &&
            (identical(other.points, points) ||
                const DeepCollectionEquality().equals(other.points, points)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(points);

  @JsonKey(ignore: true)
  @override
  _$PointStateCopyWith<_PointState> get copyWith =>
      __$PointStateCopyWithImpl<_PointState>(this, _$identity);
}

abstract class _PointState implements PointState {
  const factory _PointState({List<Point> points}) = _$_PointState;

  @override
  List<Point> get points => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PointStateCopyWith<_PointState> get copyWith =>
      throw _privateConstructorUsedError;
}
