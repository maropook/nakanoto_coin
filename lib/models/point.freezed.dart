// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Point _$PointFromJson(Map<String, dynamic> json) {
  return _Point.fromJson(json);
}

/// @nodoc
class _$PointTearOff {
  const _$PointTearOff();

  _Point call(
      {int? id,
      int point = 0,
      @JsonKey(name: 'used_point') int usedPoint = 0}) {
    return _Point(
      id: id,
      point: point,
      usedPoint: usedPoint,
    );
  }

  Point fromJson(Map<String, Object> json) {
    return Point.fromJson(json);
  }
}

/// @nodoc
const $Point = _$PointTearOff();

/// @nodoc
mixin _$Point {
  int? get id => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  @JsonKey(name: 'used_point')
  int get usedPoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointCopyWith<Point> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointCopyWith<$Res> {
  factory $PointCopyWith(Point value, $Res Function(Point) then) =
      _$PointCopyWithImpl<$Res>;
  $Res call({int? id, int point, @JsonKey(name: 'used_point') int usedPoint});
}

/// @nodoc
class _$PointCopyWithImpl<$Res> implements $PointCopyWith<$Res> {
  _$PointCopyWithImpl(this._value, this._then);

  final Point _value;
  // ignore: unused_field
  final $Res Function(Point) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? point = freezed,
    Object? usedPoint = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      usedPoint: usedPoint == freezed
          ? _value.usedPoint
          : usedPoint // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PointCopyWith<$Res> implements $PointCopyWith<$Res> {
  factory _$PointCopyWith(_Point value, $Res Function(_Point) then) =
      __$PointCopyWithImpl<$Res>;
  @override
  $Res call({int? id, int point, @JsonKey(name: 'used_point') int usedPoint});
}

/// @nodoc
class __$PointCopyWithImpl<$Res> extends _$PointCopyWithImpl<$Res>
    implements _$PointCopyWith<$Res> {
  __$PointCopyWithImpl(_Point _value, $Res Function(_Point) _then)
      : super(_value, (v) => _then(v as _Point));

  @override
  _Point get _value => super._value as _Point;

  @override
  $Res call({
    Object? id = freezed,
    Object? point = freezed,
    Object? usedPoint = freezed,
  }) {
    return _then(_Point(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      usedPoint: usedPoint == freezed
          ? _value.usedPoint
          : usedPoint // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Point implements _Point {
  const _$_Point(
      {this.id,
      this.point = 0,
      @JsonKey(name: 'used_point') this.usedPoint = 0});

  factory _$_Point.fromJson(Map<String, dynamic> json) =>
      _$_$_PointFromJson(json);

  @override
  final int? id;
  @JsonKey(defaultValue: 0)
  @override
  final int point;
  @override
  @JsonKey(name: 'used_point')
  final int usedPoint;

  @override
  String toString() {
    return 'Point(id: $id, point: $point, usedPoint: $usedPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Point &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)) &&
            (identical(other.usedPoint, usedPoint) ||
                const DeepCollectionEquality()
                    .equals(other.usedPoint, usedPoint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(point) ^
      const DeepCollectionEquality().hash(usedPoint);

  @JsonKey(ignore: true)
  @override
  _$PointCopyWith<_Point> get copyWith =>
      __$PointCopyWithImpl<_Point>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PointToJson(this);
  }
}

abstract class _Point implements Point {
  const factory _Point(
      {int? id,
      int point,
      @JsonKey(name: 'used_point') int usedPoint}) = _$_Point;

  factory _Point.fromJson(Map<String, dynamic> json) = _$_Point.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  int get point => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'used_point')
  int get usedPoint => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PointCopyWith<_Point> get copyWith => throw _privateConstructorUsedError;
}
