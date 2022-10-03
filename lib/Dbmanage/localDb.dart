import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pkp_android_app/model/pays.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDb {
  SqfliteDb.internal();
  static final SqfliteDb instance = SqfliteDb.internal();
  factory SqfliteDb() => instance;

  static const noteTable = "pays";
  static const _version = 1;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database?> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'pkpDb.db');
    debugPrint("DB PATH=$dbPath");

    var openDb = await openDatabase(dbPath, version: _version,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE actualites(id INTEGER PRIMARY KEY, miniature TEXT, contenu TEXT, video TEXT, langue_id INTEGER)');
      await db.execute('CREATE TABLE assemblees(id INTEGER PRIMARY KEY, nom TEXT, ville_id INTEGER, localisation TEXT, addresse TEXT, photo TEXT)');
    },
    onUpgrade:(Database db,int oldversion,int newversion)async{
      if(oldversion<newversion){
        debugPrint('Version Upgrade');
      }
    }
    );
    debugPrint('Db init');
    return openDb;
  }

  Future<Database?> insertDb(Classpays pays) async{
    final db=await initDb();
    await db!.insert(noteTable, pays.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
    
  }
  Future<List<Classpays>> getnote() async{
    final db=await initDb();
    final List<Map<String,dynamic>> queryResult=await db!.query(noteTable);
    return queryResult.map((e) => Classpays.fromMap(e)).toList();
  }
  Future<void> delete(int id) async{
    final db=await initDb();
   await db!.delete(
      'NOTES',
      where:'id=?',
      whereArgs: [id]
    );
    print('Demete');
  }


  
}
