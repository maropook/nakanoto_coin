import 'package:nakanoto_coin/databases/point_database.dart';
import 'package:nakanoto_coin/models/point.dart';

class PointRepository {
  final _db = PointDatabase();

  final PointDatabase _pointDatabase;

  PointRepository(this._pointDatabase);

  Future<List<Point>> getPoints() async {
    return _pointDatabase.getPoints();
  }

  Future<Point> addPoint(Point point) async {
    return _pointDatabase.insert(point);
  }

  Future<void> updatePoint(Point point) async {
    return _pointDatabase.update(point);
  }

  Future<void> deletePoint(int id) async {
    return _pointDatabase.delete(id);
  }
}
