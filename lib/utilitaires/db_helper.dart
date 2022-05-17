import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/class_exercise.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 3;
  static final String _tableName = "exercises";

  static Future<void> _createDb(Database db) async {
    await db.execute("CREATE TABLE $_tableName("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "title STRING, img STRING, time INT,"
        "repeat INT, category INT, description STRING)");
    await db.execute("CREATE TABLE category("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "category STRING, thumbnail STRING)");
  }

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'Musculation.db';
      _db =
          await openDatabase(_path,
              version: _version,
              onCreate: (db, version) {
        return _createDb(db);
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Exercise? exercise) async {
    print("insert");
    return await _db?.insert(_tableName, exercise!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_tableName);
  }

  static delete(Exercise exercise) async {
    return await _db!
        .delete(_tableName, where: 'id=?', whereArgs: [exercise.id]);
  }
}
