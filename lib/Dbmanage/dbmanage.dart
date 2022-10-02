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
    print('creation de db');

    print(join(await getDatabasesPath()));
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(join(await getDatabasesPath(), 'pkp_db.db'),
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE "pays" ("id" integer not null primary key autoincrement, "nom" varchar not null, "sigle" varchar not null, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime)');
      await db.execute(
          'CREATE TABLE "assemblees" ("id" integer not null primary key autoincrement, "nom" varchar, "ville_id" integer not null, "localisation" text, "addresse" text, "photo" text, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("ville_id") references "villes"("id") on delete cascade on update cascade)');
      await db.execute(
          'CREATE TABLE "langues" ("id" integer not null primary key autoincrement, "libelle" varchar not null, "initial" varchar not null, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime)');
      await db.execute(
          'CREATE TABLE "predications" ("id" integer not null primary key autoincrement, "titre" varchar not null, "sous_titre" varchar, "numero" integer, "lien_audio" text, "nom_audio" text, "lien_video" text, "duree" integer, "chapitre" varchar, "couverture" text, "sermon_similaire" text, "langue_id" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade)');
      await db.execute(
          'CREATE TABLE "actualites" ("id" integer not null primary key autoincrement, "miniature" text, "contenu" text not null, "video" text, "langue_id" integer not null, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade)');
      await db.execute(
          'CREATE TABLE "cantiques" ("id" integer not null primary key autoincrement, "titre" text not null, "lien_audio" text not null, "nom_fichier" text, "contenu" text, "duree" integer, "langue_id" integer, "user_id" integer not null, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade, foreign key("user_id") references "users"("id") on delete cascade on update cascade)');
      await db.execute(
          'CREATE TABLE "charge_users" ("id" integer not null primary key autoincrement, "charge_id" integer not null, "user_id" integer not null, "pays_id" integer, "assemblee_id" integer, "principal" tinyint(1) not null, "position_chantre" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("charge_id") references "charges"("id") on delete cascade on update cascade, foreign key("user_id") references "users"("id") on delete cascade on update cascade, foreign key("pays_id") references "pays"("id") on delete cascade on update cascade, foreign key("assemblee_id") references "assemblees"("id") on delete cascade on update cascade)');
      await db.execute(
          'CREATE TABLE "charges" ("id" integer not null primary key autoincrement, "libelle" varchar not null, "description" varchar, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime)');
      await db.execute(
          'CREATE TABLE "concordances" ("id" integer not null primary key autoincrement, "verset_from_id" integer not null, "verset_to_id" integer not null, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("verset_from_id") references "versets"("id") on delete cascade on update cascade, foreign key("verset_to_id") references "versets"("id") on delete cascade on update cascade)');
      await db.execute(
          'CREATE TABLE "confirmes" ("id" integer not null primary key autoincrement, "user_id" integer not null, "pays_id" integer not null, "video_id" integer, "langue_id" integer, "details" text, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("user_id") references "users"("id") on delete cascade on update cascade, foreign key("pays_id") references "pays"("id") on delete cascade on update cascade, foreign key("video_id") references "videos"("id") on delete cascade on update cascade, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade)');
      await db.execute(
          'CREATE TABLE "langue_pays" ("id" integer not null primary key autoincrement, "langue_id" integer not null, "pays_id" integer not null, "principal" tinyint(1) not null, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade, foreign key("pays_id") references "pays"("id") on delete cascade on update cascade)');
      await db.execute(
          'CREATE TABLE "photos" ("id" integer not null primary key autoincrement, "url" text not null, "lieu" text, "description" text, "langue_id" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade)');
      await db.execute(
          'CREATE TABLE "temoignages" ("id" integer not null primary key autoincrement, "titre" text, "lien_video" text, "photo" text, "contenu" text, "langue_id" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade)');
      await db.execute(
          'CREATE TABLE "types" ("id" integer not null primary key autoincrement, "libelle" varchar not null, "description" text, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime)');
      await db.execute(
          'CREATE TABLE "users" ("id" integer not null primary key autoincrement, "first_name" varchar not null, "last_name" varchar, "telephone" varchar, "avatar" text, "facebook" text, "youtube" text, "email" varchar, "email_verified_at" datetime, "password" varchar, "remember_token" varchar, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime)');
      await db.execute(
          'CREATE TABLE "versets" ("id" integer not null primary key autoincrement, "numero" integer not null, "contenu" text not null, "info" text, "predication_id" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("predication_id") references "predications"("id") on delete cascade on update cascade)');
      await db.execute(
          'CREATE TABLE "videos" ("id" integer not null primary key autoincrement, "titre" text not null, "url" text not null, "lieu" text, "description" text, "type_id" integer, "langue_id" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("type_id") references "types"("id") on delete cascade on update cascade, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade)');
      await db.execute(
          'CREATE TABLE "villes" ("id" integer not null primary key autoincrement, "libelle" varchar not null, "description" text, "pays_id" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("pays_id") references "pays"("id") on delete cascade on update cascade)');
    }, version: 1);
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
    await db
        .update("pays", pays.toJson(), where: "id = ?", whereArgs: [pays.id]);
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
}
