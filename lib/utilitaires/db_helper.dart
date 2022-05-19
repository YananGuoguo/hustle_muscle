import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/class_exercise.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 3;
  static const String _tableName = "exercises";
  static const String _categoryTable="category";

  static Future<void> _createDb(Database db) async {
    await db.execute("CREATE TABLE $_tableName("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "title STRING, img STRING, time INT,"
        "repeat INT, category INT, description STRING, video STRING)");
    await db.execute("CREATE TABLE $_categoryTable("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "category STRING, thumbnail STRING)");
    await _insertAllData(db);
  }

  static Future<void> _insertAllData(Database db) async {
  //  insert categories
    await db.execute("INSERT INTO $_categoryTable values (?, ?, ?)",
        [1, 'abdominaux', 'assets/images/abdominaux.jpg']);
    await db.execute("INSERT INTO $_categoryTable values (?, ?, ?)",
        [2, 'biceps', 'assets/images/biceps.jpg']);
    await db.execute("INSERT INTO $_categoryTable values (?, ?, ?)",
        [3, 'cuisses', 'assets/images/cuisses.jpg']);
    await db.execute("INSERT INTO $_categoryTable values (?, ?, ?)",
        [4, 'dos', 'assets/images/dos.jpg']);
    await db.execute("INSERT INTO $_categoryTable values (?, ?, ?)",
        [5, 'epaules', 'assets/images/epaules.jpg']);
    await db.execute("INSERT INTO $_categoryTable values (?, ?, ?)",
        [6, 'mollets', 'assets/images/mollets.jpg']);
    await db.execute("INSERT INTO $_categoryTable values (?, ?, ?)",
        [7, 'parties', 'assets/images/parties.jpg']);
    await db.execute("INSERT INTO $_categoryTable values (?, ?, ?)",
        [8, 'triceps', 'assets/images/triceps.jpg']);

    //insert exercises data
    //Exercise({this.id, this.title, this.img, this.time, this.repeat, this.category,
    //       this.description});
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['crunch-au-sol', 'assets/musculation/abdominaux/crunch-au-sol.jpg', 10, 12, 1, 'Le crunch est un exercice simple et efficace pour muscler les abdominaux. Il affine et raffermit la taille si vous travaillez avec le poids du corps, et développe les abdominaux si vous utilisez un lest de plus en plus lourd. Il ne nécessite pas de matériel et peut être réalisé n’importe où.', 'https://www.youtube.com/watch?v=zUk1BiL6Ajc&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['crunch-poulie', 'assets/musculation/abdominaux/crunch-poulie.jpg', 11, 18, 1, 'Le crunch à la corde effectué sur la poulie haute est un exercice très efficace pour travailler la sangle abdominale. Il consiste à enrouler le buste vers l\'avant en tirant sur la poulie, ce qui reproduit le mouvement du crunch classique, mais à la verticale.', 'https://www.youtube.com/watch?v=UZBfM_p3138']);

  }

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'Musculation.db';
      _db = await openDatabase(_path,
              version: _version,
              onCreate: (db, version) {
        return _createDb(db);
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Exercise? exercise) async {
    print("insert in db_helper!!!");
    return await _db?.insert(_tableName, exercise!.toJson()) ?? 1;
  }

  static Future<int> update(Exercise? exercise) async {
    print("update in db_helper!!!");
    var res = await _db?.update(_tableName, exercise!.toJson(), where: "id = ?", whereArgs: [exercise.id]) ?? 1;
    return res;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called in db_helper!!!");
    return await _db!.query(_tableName);
  }

  static Future<List<Map<String, dynamic>>> queryCategory() async {
    print("query category called");
    return await _db!.query(_categoryTable);
  }

  static Future<List<Map<String, dynamic>>> queryExerciseByCategory(category) async {
    return await _db!.rawQuery('SELECT * FROM $_tableName WHERE category=?',[category]);
  }

  static delete(Exercise exercise) async {
    return await _db!
        .delete(_tableName, where: 'id=?', whereArgs: [exercise.id]);
  }
}
