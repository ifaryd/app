/* import 'package:sqflite/sqflite.dart';

import '../model/assemblees.dart';
import '../model/langues.dart';
import '../model/pays.dart';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:pkp_android_app/model/assemblees.dart';
import 'package:pkp_android_app/model/pays.dart';
import 'package:sqflite/sqflite.dart';

import '../model/langues.dart';

class PkpDatabase {
  PkpDatabase.internal();

  static final PkpDatabase instance = PkpDatabase.internal();
  static Database? _database;

  Future<Database> get database async => _database ??= await initDB();

  /*Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }*/

  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join(await getDatabasesPath(), 'pkp_db.db'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE pays(id INTEGER PRIMARY KEY, libelle TEXT, initial TEXT)"
            "CREATE TABLE actualites(id INTEGER PRIMARY KEY, miniature TEXT, contenu TEXT, video TEXT, langue_id INTEGER)"
            "CREATE TABLE assemblees(id INTEGER PRIMARY KEY, nom TEXT, ville_id INTEGER, localisation TEXT, addresse TEXT, photo TEXT)"
            "CREATE TABLE cantiques(id INTEGER PRIMARY KEY, titre TEXT, lien_audio TEXT, contenu TEXT, duree INTEGER, langue_id INTEGER, user_id INTEGER)"
            "CREATE TABLE charges(id INTEGER PRIMARY KEY, libelle TEXT, description TEXT)"
            "CREATE TABLE charge_user(id INTEGER PRIMARY KEY, charge_id INTEGER, user_id INTEGER, pays_id INTEGER, assemblee_id INTEGER, principal INTEGER, position_chantre INTEGER)"
            "CREATE TABLE concordances(id INTEGER PRIMARY KEY, verset_from_id INTEGER, verset_to_id INTEGER)"
            "CREATE TABLE confirmes(id INTEGER PRIMARY KEY, user_id INTEGER, pays_id INTERGER, video_id INTEGER, details TEXT)"
            "CREATE TABLE langues(id INTEGER PRIMARY KEY, libelle TEXT, initial TEXT, createdAt TEXT DEFAULT CURRENT_TIMESTAMP, updatedAt TEXT DEFAULT CURRENT_TIMESTAMP, deletedAt TEXT DEFAULT CURRENT_TIMESTAMP)"
            "CREATE TABLE langue_pays(id INTEGER PRIMARY KEY, langue_id INTEGER, pays_id INTEGER, principal TEXT)"
            "CREATE TABLE pays(id INTEGER PRIMARY KEY, nom TEXT, sigle TEXT)"
            "CREATE TABLE photos(id INTEGER PRIMARY KEY, url TEXT, lieu TEXT, description TEXT, langue_id INTEGER)"
            "CREATE TABLE predications(id INTEGER PRIMARY KEY, titre TEXT, sous_titre TEXT, numero INTEGER, lien_audio TEXT, nom_audio TEXT, lien_video TEXT, duree INTEGER, chapitre TEXT, couverture TEXT, sermon_similaire TEXT, langue_id INTEGER)"
            "CREATE TABLE temoignages(id INTEGER PRIMARY KEY, titre TEXT, lien_video TEXT, photo TEXT, contenu TEXT, langue_id INTEGER)"
            "CREATE TABLE types(id INTEGER PRIMARY KEY, libelle TEXT, description TEXT)"
            "CREATE TABLE versets(id INTEGER PRIMARY KEY, numero INTEGER, contenu TEXT, info TEXT, predication_id INTEGER)"
            "CREATE TABLE users(id INTEGER PRIMARY KEY, first_name TEXT, last_name TEXT, telephone TEXT, avatar TEXT, facebook TEXT, youtube TEXT, email TEXT, email_verified_at TEXT, password TEXT, remember_token TEXT)"
            "CREATE TABLE videos(id INTEGER PRIMARY KEY, titre TEXT, url TEXT, lieu TEXT, description TEXT, type_id INTEGER, langue_id INTEGER)"
            "CREATE TABLE villes(id INTEGER PRIMARY KEY, libelle TEXT, description TEXT, pays_id INTEGER)");
      },
      version: 1,
    );
  }

//--------------CRUD------------------
//---INSERTION
  void insertPays(Paysmodel pays) async {
    final Database db = await database;
    await db.insert(
      'pays',
      pays.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void insertLangue(LangueModel langue) async {
    final Database db = await database;
    await db.insert(
      'langues',
      langue.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
void insertAssemblees(ClassAssemblees assemblees) async {
  final Database db = await database;
  await db.insert(
    'assemblees',
    assemblees.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

//---UPDATE
void updatePays(Paysmodel pays) async {
  final Database db = await database;
  await db.update("pays", pays.toJson(), where: "id = ?", whereArgs: [pays.id]);
}

void updateLangue(LangueModel langues) async {
  final Database db = await database;
  await db.update("langues", langues.toJson(),
      where: "id = ?", whereArgs: [langues.id]);
}

void updateAssemblees(ClassAssemblees assemblees) async {
  final Database db = await database;
  await db.update("assemblees", assemblees.toMap(),
      where: "id = ?", whereArgs: [assemblees.id]);
}

//---DELETE
void deletePays(int id) async {
  final Database db = await database;
  db.delete("pays", where: "id = ?", whereArgs: [id]);
}

void deleteAssemblees(int id) async {
  final Database db = await database;
  db.delete("assemblees", where: "id = ?", whereArgs: [id]);
}

//---LISTE
Future<List<Paysmodel>> listepays() async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.query('pays');
  List<Paysmodel> listepays = List.generate(maps.length, (i) {
    return Paysmodel.fromJson(maps[i]);
  });
  return listepays;
}

Future<List<LangueModel>> listlangue() async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.query('langues');
  List<LangueModel> listlangues = List.generate(maps.length, (i) {
    return LangueModel.fromJson(maps[i]);
  });
  return listlangues;
}
Future<List<ClassAssemblees>> listeAssemblees() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('assemblees');
    List<ClassAssemblees> listeassemblees = List.generate(maps.length, (i) {
      return ClassAssemblees.fromMap(maps[i]);
    });
    return listeassemblees;
  }
//--------------FIN CRUD------------------
} */