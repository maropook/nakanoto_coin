import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nakanoto_coin/models/point.dart';

part 'point_state.freezed.dart';

@freezed
abstract class PointState with _$PointState {
  const factory PointState({
    @Default([]) List<Point> points,
  }) = _PointState;
}
