import 'dart:convert';

import 'package:pkp_android_app/Dbmanage/dbmanage.dart';
import 'package:pkp_android_app/lienApi.dart';
import 'package:pkp_android_app/model/assemblees.dart';
import 'package:pkp_android_app/model/charges.dart';
import 'package:pkp_android_app/model/types.dart';
import 'package:pkp_android_app/model/videos.dart';
import 'package:pkp_android_app/model/villes.dart';

import '../model/pays.dart';
import 'package:http/http.dart' as http;

class saveSqflite {
  static Future getpays() async {
    final response = await http.get(Uri.parse('${Apilink.url}pays'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datax = data['data'];

      for (var u in datax) {
        PkpDatabase.instance.insertPays(Paysmodel(
            id: u['id'],
            nom: u['nom'],
            sigle: u['sigle'],
            createdAt: u['created_at'],
            updatedAt: u['updated_at'],
            deletedAt: u['deleted_at']
            // langues: u['langues']
            ));
      }
    } else {
      print(response.statusCode);
    }
  }

  static Future getvilles() async {
    final response = await http.get(Uri.parse('${Apilink.url}villes'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datax = data['data'];

      for (var u in datax) {
        PkpDatabase.instance.insertVilles(Villemodel(
            id: u['id'],
            libelle: u['libelle'],
            description: u['description'],
            paysId: u['pays_id'],
            createdAt: u['created_at'],
            updatedAt: u['updated_at'],
            deletedAt: u['deleted_at']));
      }
    } else {
      print(response.statusCode);
    }
  }

  static Future getAssemblees() async {
    final response = await http.get(Uri.parse('${Apilink.url}assemblees'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datax = data['data'];

      for (var u in datax) {
        PkpDatabase.instance.insertAssemb(assemblesmodel(
            id: u['id'],
            nom: u['nom'],
            villeId: u['ville_id'],
            localisation: u['localisation'],
            addresse: u['addresse'],
            photo: u['photo'],
            createdAt: u['created_at'],
            updatedAt: u['updated_at'],
            deletedAt: u['deleted_at']));
      }
    } else {
      print(response.statusCode);
    }
  }

  static Future getTypes() async {
    final response = await http.get(Uri.parse('${Apilink.url}types'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datax = data['data'];

      for (var u in datax) {
        PkpDatabase.instance.insertTypes(TypesModel(
            id: u['id'],
            libelle: u['libelle'],
            description: u['description'],
            createdAt: u['created_at'],
            updatedAt: u['updated_at'],
            deletedAt: u['deleted_at']));
      }
    } else {
      print(response.statusCode);
    }
  }

  static Future getVideo() async {
    final response = await http.get(Uri.parse('${Apilink.url}videos'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datax = data['data'];

      for (var u in datax) {
        PkpDatabase.instance.insertVideo(VideoModel(
            id: u['id'],
            titre: u['titre'],
            url: u['url'],
            lieu: u['lieu'],
            description: u['description'],
            typeId: u['type_id'],
            langueId: u['langue_id'],
            createdAt: u['created_at'],
            updatedAt: u['updated_at'],
            deletedAt: u['deleted_at']));
      }
    } else {
      print(response.statusCode);
    }
  }

  static Future getCharge() async {
    final response = await http.get(Uri.parse('${Apilink.url}charges'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datax = data['data'];

      for (var u in datax) {
        PkpDatabase.instance.insertCharges(ChargeModel(
            id: u['id'],
            libelle: u['libelle'],
            description: u['description'],
            createdAt: u['created_at'],
            updatedAt: u['updated_at'],
            deletedAt: u['deleted-at']));
      }
    } else {
      print(response.statusCode);
    }
  }
}
