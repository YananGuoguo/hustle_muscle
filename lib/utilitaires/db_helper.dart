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
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['flexions-machine', 'assets/musculation/abdominaux/flexions-machine.jpg', 12, 10, 1, "Les muscles ciblés par les flexions du buste à la machine sont principalement le grand droit, sollicité dans son amplitude complète, mais aussi l'ensemble des abdominaux supérieurs et inférieurs. De façon plus secondaire, cet exercice sollicite également les muscles dentelés et les obliques.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['releve-genoux', 'assets/musculation/abdominaux/releve-genoux.jpg', 12, 10, 1, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);

    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['curl-barre', 'assets/musculation/biceps/curl-barre.jpg', 12, 10, 2, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['curl-concentration', 'assets/musculation/biceps/curl-concentration.jpg', 12, 10, 2, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['curl-haltere', 'assets/musculation/biceps/curl-haltere.jpg', 12, 10, 2, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['curl-incline', 'assets/musculation/biceps/curl-incline.jpg', 12, 10, 2, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['curl-pupitre', 'assets/musculation/biceps/curl-pupitre.jpg', 12, 10, 2, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);

    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['front-squat', 'assets/musculation/cuisses/front-squat.jpg', 12, 10, 3, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['hack-squat', 'assets/musculation/cuisses/hack-squat.jpg', 12, 10, 3, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['presse-cuisses', 'assets/musculation/cuisses/presse-cuisses.jpg', 12, 10, 3, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['programme-cuisses', 'assets/musculation/cuisses/programme-cuisses.jpg', 12, 10, 3, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['squat-1-jambe', 'assets/musculation/cuisses/squat-1-jambe.jpg', 12, 10, 3, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);

    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['tirage-devant', 'assets/musculation/dos/tirage-devant.jpg', 10, 12, 4, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['tirage-nuque', 'assets/musculation/dos/tirage-nuque.jpg', 10, 12, 4, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['tirage-serre', 'assets/musculation/dos/tirage-serre.jpg', 10, 12, 4, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['tractions', 'assets/musculation/dos/tractions.jpg', 10, 12, 4, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['trapezes', 'assets/musculation/dos/trapezes.jpg', 10, 12, 4, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);

    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['developpe-devant', 'assets/musculation/epaules/developpe-devant.jpg', 10, 12, 5, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['developpe-nuque', 'assets/musculation/epaules/developpe-nuque.jpg', 10, 12, 5, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['developpe-laterales', 'assets/musculation/epaules/developpe-laterales.jpg', 10, 12, 5, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['force-performance', 'assets/musculation/epaules/force-performance.jpg', 10, 12, 5, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['rowing-menton', 'assets/musculation/epaules/rowing-menton.jpg', 10, 12, 5, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);

    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['donkey', 'assets/musculation/mollets/donkey.jpg', 10, 12, 6, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['mollets', 'assets/musculation/mollets/mollets.jpg', 10, 12, 6, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['mollets-assis', 'assets/musculation/mollets/mollets-assis.jpg', 10, 12, 6, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['mollets-presse', 'assets/musculation/mollets/mollets-presse.jpg', 10, 12, 6, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);

    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['curl-gironda', 'assets/musculation/parties/curl-gironda.jpg', 10, 12, 7, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['dch', 'assets/musculation/parties/dch.jpg', 10, 12, 7, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['developpe-assis', 'assets/musculation/parties/developpe-assis.jpg', 10, 12, 7, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['developpe-couche', 'assets/musculation/parties/developpe-couche.jpg', 10, 12, 7, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['dev-couche-smit', 'assets/musculation/parties/developpe-couche-smit.jpg', 10, 12, 7, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['dive', 'assets/musculation/parties/dive.jpg', 10, 12, 7, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['ecarte-couche', 'assets/musculation/parties/ecarte-couche.jpg', 10, 12, 7, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['muscule-pompes', 'assets/musculation/parties/musculaction-pompes.jpg', 10, 12, 7, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['pec-deck', 'assets/musculation/parties/pec-deck.jpg', 10, 12, 7, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);

    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['barre-front', 'assets/musculation/triceps/barre-front.jpg', 10, 12, 8, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['DPS', 'assets/musculation/triceps/dc-prise-serree.jpg', 10, 12, 8, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['extensions', 'assets/musculation/triceps/extensions.jpg', 10, 12, 8, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['kick-back', 'assets/musculation/triceps/kick-back.jpg', 10, 12, 8, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
    await db.execute("INSERT INTO $_tableName (title, img, time, repeat, category, description, video) VALUES (?, ?, ?, ?, ?, ?, ?)",
        ['poulie', 'assets/musculation/triceps/poulie.jpg', 10, 12, 8, "Il sollicite le grand droit des abdominaux en statique, le droit antérieur et le psoas iliaque. Le grand droit fait partie de la sangle abdominale avec les obliques et le transverse. L’action du grand droit est la flexion du tronc.", 'https://www.youtube.com/watch?v=UYfuax8KwcE&t=2s']);
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
