import 'package:nakanoto_coin/databases/point_database.dart';
import 'package:nakanoto_coin/models/point.dart';
import 'package:nakanoto_coin/models/point.dart';
import 'package:nakanoto_coin/repositories/point_repository.dart';
import 'package:nakanoto_coin/states/point_state.dart';
import 'package:riverpod/riverpod.dart';

final pointViewModelProvider =
    StateNotifierProvider<PointViewModelProvider, PointState>(
  (ref) => PointViewModelProvider(
    ref.read,
    PointRepository(PointDatabase()),
  ),
);

class PointViewModelProvider extends StateNotifier<PointState> {
  PointViewModelProvider(this._reader, this._pointRepository)
      : super(const PointState()) {
    getPoints();
  }

  final Reader _reader;
  final PointRepository _pointRepository;

  Future<void> addPoint(String title) async {
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

    state = state.copyWith(
      points: points,
    );
  }

  Future<void> changeStatus(Point point) async {
    final newPoint = point.copyWith(
      point: point.point + 10,
    );

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
