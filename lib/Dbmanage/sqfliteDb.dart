// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:pkp_android_app/model/assemblees.dart';
import 'package:pkp_android_app/model/cantiques.dart';
import 'package:pkp_android_app/model/charge_user.dart';
import 'package:pkp_android_app/model/charges.dart';
import 'package:pkp_android_app/model/confirmes.dart';
import 'package:pkp_android_app/model/pays.dart';
import 'package:pkp_android_app/model/predications.dart';
import 'package:pkp_android_app/model/temoignages.dart';
import 'package:pkp_android_app/model/types.dart';
import 'package:pkp_android_app/model/versets.dart';
import 'package:pkp_android_app/model/videos.dart';
import 'package:pkp_android_app/model/villes.dart';
import 'package:sqflite/sqflite.dart';

import '../model/langues.dart';

class PkpDatabase {
  PkpDatabase.internal(); 

  static final PkpDatabase instance = PkpDatabase.internal();
  static Database? _database;

  //Future<Database> get database async => _database ??= await initDB();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDB();
      return _database!;
    }
  }
  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(join(await getDatabasesPath(), 'pkpDb.db'),
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE "pays" ("id" integer not null primary key autoincrement, "nom" varchar not null, "sigle" varchar not null, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime)').whenComplete(() => print('Pays créer'));
      await db.execute(
          'CREATE TABLE "assemblees" ("id" integer not null primary key autoincrement, "nom" varchar, "ville_id" integer not null, "localisation" text, "addresse" text, "photo" text, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("ville_id") references "villes"("id") on delete cascade on update cascade)').whenComplete(() => print('Assemblees créer'));
      await db.execute(
          'CREATE TABLE "langues" ("id" integer not null primary key autoincrement, "libelle" varchar not null, "initial" varchar not null, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime)').whenComplete(() => print('langues créer'));

      await db.execute(
          'CREATE TABLE "predications" ("id" integer not null primary key autoincrement, "titre" varchar not null, "sous_titre" varchar, "numero" integer, "lien_audio" text, "nom_audio" text, "lien_video" text, "duree" integer, "chapitre" varchar, "couverture" text, "sermon_similaire" text, "langue_id" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, "lien_audio_cloud" text, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade)'
          ).whenComplete(() => print('Predications créer'));
      await db.execute(
          'CREATE TABLE "actualites" ("id" integer not null primary key autoincrement, "miniature" text, "contenu" text not null, "video" text, "langue_id" integer not null, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade)').whenComplete(() => print('Actualites créer'));
      await db.execute(
          'CREATE TABLE "cantiques" ("id" integer not null primary key autoincrement, "titre" text not null, "lien_audio" text not null, "nom_fichier" text, "contenu" text, "duree" integer, "langue_id" integer, "user_id" integer not null, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade, foreign key("user_id") references "users"("id") on delete cascade on update cascade)').whenComplete(() => print('cantiques créer'));
      await db.execute(
          'CREATE TABLE "charge_users" ("id" integer not null primary key autoincrement, "charge_id" integer not null, "user_id" integer not null, "pays_id" integer, "assemblee_id" integer, "principal" tinyint(1) not null, "position_chantre" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("charge_id") references "charges"("id") on delete cascade on update cascade, foreign key("user_id") references "users"("id") on delete cascade on update cascade, foreign key("pays_id") references "pays"("id") on delete cascade on update cascade, foreign key("assemblee_id") references "assemblees"("id") on delete cascade on update cascade)').whenComplete(() => print('user_charges créer'));
      await db.execute(
          'CREATE TABLE "charges" ("id" integer not null primary key autoincrement, "libelle" varchar not null, "description" varchar, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime)').whenComplete(() => print('Charges créer'));
      await db.execute(
          'CREATE TABLE "concordances" ("id" integer not null primary key autoincrement, "verset_from_id" integer not null, "verset_to_id" integer not null, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("verset_from_id") references "versets"("id") on delete cascade on update cascade, foreign key("verset_to_id") references "versets"("id") on delete cascade on update cascade)').whenComplete(() => print('Concordances créer'));
      await db.execute(
          'CREATE TABLE "confirmes" ("id" integer not null primary key autoincrement, "user_id" integer not null, "pays_id" integer not null, "video_id" integer, "langue_id" integer, "details" text, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("user_id") references "users"("id") on delete cascade on update cascade, foreign key("pays_id") references "pays"("id") on delete cascade on update cascade, foreign key("video_id") references "videos"("id") on delete cascade on update cascade, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade)').whenComplete(() => print('Confirmer créer'));
      await db.execute(
          'CREATE TABLE "langue_pays" ("id" integer not null primary key autoincrement, "langue_id" integer not null, "pays_id" integer not null, "principal" tinyint(1) not null, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade, foreign key("pays_id") references "pays"("id") on delete cascade on update cascade)').whenComplete(() => print('Langues_pays créer'));
      await db.execute(
          'CREATE TABLE "photos" ("id" integer not null primary key autoincrement, "url" text not null, "lieu" text, "description" text, "langue_id" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade)').whenComplete(() => print('Photos créer'));
      await db.execute(
          'CREATE TABLE "temoignages" ("id" integer not null primary key autoincrement, "titre" text, "lien_video" text, "photo" text, "contenu" text, "langue_id" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade)').whenComplete(() => print('Temoignages créer'));
      await db.execute(
          'CREATE TABLE "types" ("id" integer not null primary key autoincrement, "libelle" varchar not null, "description" text, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime)').whenComplete(() => print('Types créer'));
      await db.execute(
          'CREATE TABLE "users" ("id" integer not null primary key autoincrement, "first_name" varchar not null, "last_name" varchar, "telephone" varchar, "avatar" text, "facebook" text, "youtube" text, "email" varchar, "email_verified_at" datetime, "password" varchar, "remember_token" varchar, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime)').whenComplete(() => print('Users créer'));
      await db.execute(
          'CREATE TABLE "versets" ("id" integer not null primary key autoincrement, "numero" integer not null, "contenu" text not null, "info" text, "predication_id" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("predication_id") references "predications"("id") on delete cascade on update cascade)').whenComplete(() => print('Versets créer'));
      await db.execute(
          'CREATE TABLE "videos" ("id" integer not null primary key autoincrement, "titre" text not null, "url" text not null, "lieu" text, "description" text, "type_id" integer, "langue_id" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("type_id") references "types"("id") on delete cascade on update cascade, foreign key("langue_id") references "langues"("id") on delete cascade on update cascade)').whenComplete(() => print('Videos créer'));
      await db.execute(
          'CREATE TABLE "villes" ("id" integer not null primary key autoincrement, "libelle" varchar not null, "description" text, "pays_id" integer, "created_at" datetime, "updated_at" datetime, "deleted_at" datetime, foreign key("pays_id") references "pays"("id") on delete cascade on update cascade)').whenComplete((){
            print('Villes créer ');print('CREATION DE DB TERMINER');
          });
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

  void insertVilles(Villemodel villes) async {
    final Database db = await database;
    await db.insert(
      'villes',
      villes.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void insertAssemb(assemblesmodel assemblees) async {
    final Database db = await database;
    await db.insert(
      'assemblees',
      assemblees.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void insertPred(ModelPredications predications) async {
    final Database db = await database;
    await db.insert(
      'predications',
      predications.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void insertVerset(ModelVerset verset) async {
    final Database db = await database;
    await db.insert(
      'versets',
      verset.toJson(),
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

  void insertCantiques(ModelCantiques cantiques) async {
    final Database db = await database;
    await db.insert(
      'cantiques',
      cantiques.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void insertTypes(TypesModel type) async {
    final Database db = await database;
    await db.insert(
      'types',
      type.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void insertAssemblees(assemblesmodel assemblees) async {
    final Database db = await database;
    await db.insert(
      'assemblees',
      assemblees.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void insertVideo(VideoModel videos) async {
    final Database db = await database;
    await db.insert(
      'videos',
      videos.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void insertCharges(ChargeModel charges) async {
    final Database db = await database;
    await db.insert(
      'charges',
      charges.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void insertUsers(ModelUsers users) async {
    final Database db = await database;
    await db.insert(
      'users',
      users.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void insertConfirmes(ModelConfirmes confirmes) async {
    final Database db = await database;
    await db.insert(
      'confirmes',
      confirmes.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void insertTemoignage(ModelTemoignages temoignages) async {
    final Database db = await database;
    await db.insert(
      'temoignages',
      temoignages.toJson(),
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

  void updateAssemblees(assemblesmodel assemblees) async {
    final Database db = await database;
    await db.update("assemblees", assemblees.toJson(),
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

//---ReAD

  Future<List<ModelPredications>> listPred() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('predications');
    List<ModelPredications> listpreds = List.generate(maps.length, (i) {
      return ModelPredications.fromJson(maps[i]);
    });
    return listpreds;
  }

  Future<List<ModelVerset>> listVerset({required int idx}) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db
        .query('versets', where: 'predication_id = ?', whereArgs: [idx]);
    List<ModelVerset> listpreds = List.generate(maps.length, (i) {
      return ModelVerset.fromJson(maps[i]);
    });
    return listpreds;
  }

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

  Future<List<assemblesmodel>> listeAssemblees() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('assemblees');
    List<assemblesmodel> listeassemblees = List.generate(maps.length, (i) {
      return assemblesmodel.fromJson(maps[i]);
    });
    return listeassemblees;
  }
//--------------FIN CRUD------------------
}
