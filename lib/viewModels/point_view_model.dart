import 'package:nakanoto_coin/databases/point_database.dart';
import 'package:nakanoto_coin/models/point.dart';
import 'package:nakanoto_coin/repositories/point_repository.dart';
import 'package:nakanoto_coin/states/point_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pointViewModelProvider =
    StateNotifierProvider<PointViewModelProvider, PointState>(
  (ref) => PointViewModelProvider(
    PointRepository(PointDatabase()),
  ),
);

class PointViewModelProvider extends StateNotifier<PointState> {
  PointViewModelProvider(this._pointRepository) : super(PointState()) {
    getPoints();
  }

  final PointRepository _pointRepository;

  Future<void> addPoint() async {
    final point = await _pointRepository.addPoint(const Point(
      point: 0,
      usedPoint: 0,
    ));

    state = state.copyWith(
      points: [point, ...state.points],
    );
  }

  Future<void> getPoints() async {
    final points = await _pointRepository.getPoints();
    if (points.isEmpty) {
      await addPoint();
    }
    state = state.copyWith(
      points: points,
    );
  }

  Future<void> changeStatus(Point point, int changePoint, bool isPay) async {
    if (isPay && point.point < changePoint) {
      return;
    }
    final newPoint = point.copyWith(
        point: isPay ? point.point - changePoint : point.point + changePoint,
        usedPoint: isPay ? point.usedPoint + changePoint : point.usedPoint);

    await _pointRepository.updatePoint(newPoint);

    final points = state.points
        .map((point) => point.id == newPoint.id ? newPoint : point)
        .toList();

    state = state.copyWith(
      points: points,
    );
  }

  Future<void> deletePoint(int pointId) async {
    await _pointRepository.deletePoint(pointId);

    final points = state.points.where((point) => point.id != pointId).toList();

    state = state.copyWith(
      points: points,
    );
  }
}
