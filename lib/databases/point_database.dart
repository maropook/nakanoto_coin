import 'package:nakanoto_coin/databases/app_database.dart';
import 'package:nakanoto_coin/models/point.dart';
import 'package:sqflite/sqflite.dart';

class PointDatabase extends AppDatabase {
  final String _tableName = 'points';

  Future<List<Point>> getPoints() async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      orderBy: 'id DESC',
    );

    if (maps.isEmpty) return [];

    return maps.map((map) => Point.fromJson(map)).toList();
  }

  Future<Point> insert(Point point) async {
    final db = await database;

    final id = await db.insert(
      _tableName,
      point.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return point.copyWith(
      id: id,
    );
  }

  Future update(Point point) async {
    final db = await database;

    return await db.update(
      _tableName,
      point.toJson(),
      where: 'id = ?',
      whereArgs: [point.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future delete(int id) async {
    final db = await database;

    return await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
