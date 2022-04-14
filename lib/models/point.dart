import 'package:freezed_annotation/freezed_annotation.dart';

part 'point.freezed.dart';
part 'point.g.dart';

@freezed
abstract class Point with _$Point {
  const factory Point({
    int? id,
    @Default(0) int point,
    @JsonKey(name: 'used_point') @Default(0) int usedPoint,
  }) = _Point;

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}
