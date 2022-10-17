// ignore_for_file: file_names, depend_on_referenced_packages, camel_case_types

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pkp_android_app/Dbmanage/sqfliteDb.dart';
import 'package:pkp_android_app/lienApi.dart';
import 'package:pkp_android_app/model/assemblees.dart';
import 'package:pkp_android_app/model/cantiques.dart';
import 'package:pkp_android_app/model/charge_user.dart';
import 'package:pkp_android_app/model/charges.dart';
import 'package:pkp_android_app/model/confirmes.dart';
import 'package:pkp_android_app/model/langues.dart';
import 'package:pkp_android_app/model/temoignages.dart';
import 'package:pkp_android_app/model/types.dart';
import 'package:pkp_android_app/model/versets.dart';
import 'package:pkp_android_app/model/videos.dart';
import 'package:pkp_android_app/model/villes.dart';

import '../model/pays.dart';
import 'package:http/http.dart' as http;

import '../model/predications.dart';
  
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
      debugPrint('Getpays has error');
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
      debugPrint('Getpays has error');
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
    debugPrint('Getpays has error');
    }
  }

  static Future getPreds({required int? langId}) async {
   if(langId!=null){
      final response =
        await http.get(Uri.parse('${Apilink.url}predications?langue=$langId'));
        if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datax = data['data'];
      for (var u in datax) {
        PkpDatabase.instance.insertPred(
          ModelPredications(
              id: u['id'],
              titre: u['titre'],
              sousTitre: u['sous_titre'],
              numero: u['numero'],
              lienAudio: u['lien_audio'],
              nomAudio: u['nom_audio'],
              lienVideo: u['lien_video'],
              duree: u['duree'],
              chapitre: u['chapitre'],
              couverture: u['couverture'],
              sermonSimilaire: u['sermon_similaire'],
              langueId: u['langue_id'],
              createdAt: u['created_at'],
              updatedAt: u['updated_at'],
              deletedAt: u['deleted_at'],
              lien_audio_cloud:u['lien_audio_cloud']
              ),
             
        );
      }
      return "Succes";
    } else {
      return "Error";
    }
   }else{
     Future.error('data null');
   }
  }
  static Future getVersets({required int? langId}) async {
    print('langue verset $langId');
    final response =
        await http.get(Uri.parse('${Apilink.url}predications?langue=$langId'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datax = data['data'];
      for (var u in datax) {
        var versItem=u['versets'];
        for (var v in versItem) {
          PkpDatabase.instance.insertVerset(
           ModelVerset(
        id: v["id"],
        numero: v["numero"],
        contenu: v["contenu"],
        info: v["info"],
        predicationId: v["predication_id"],
        createdAt: v["created_at"],
        updatedAt: v["updated_at"],
        deletedAt: v["deleted_at"],
    ),
        );
        }
        
      }
      return "Succes";
    } else {
      return "Error";
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
    debugPrint('getTypes has error');
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
    debugPrint('getVideo has error');
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
    debugPrint('getCharge has error');
    }
  }
  static Future getChargesUsers() async {
    final response = await http.get(Uri.parse('${Apilink.url}users'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datax = data['data'];

      for (var u in datax) {
        PkpDatabase.instance.insertUsers(
          ModelUsers(id: u['id'], firstName: u['first_name'], lastName: u['last_name'],  telephone: u['telephone'], email: u['email'], avatar: u['avatar'], youtube: u['youtube'], facebook: u['facebook'], createdAt: u['created_at'], updatedAt: u['updated_at'], deletedAt:u['deleted_at'])
            );
      }
    } else {
    debugPrint('getChargesUsers has error');
    }
  }
  static Future getConfirmes() async {
    final response = await http.get(Uri.parse('${Apilink.url}confirmes'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datax = data['data'];
      for (var u in datax) {
        PkpDatabase.instance.insertConfirmes(
          ModelConfirmes(id: u['id'], userId: u['user_id'], paysId:u['pays_id'], videoId:u['video_id'], langueId:u['langue_id'], details:u['details'], createdAt:u['created_at'], updatedAt:u['updated_at'], deletedAt:u['deleted_at'], ),
            );
      }
    } else {
    debugPrint('getConfirmes has error');
    }
  }
  static Future getTemoignages() async {
    final response = await http.get(Uri.parse('${Apilink.url}temoignages'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datax = data['data'];
      for (var u in datax) {
        PkpDatabase.instance.insertTemoignage(
          ModelTemoignages(id: u['id'], titre: u['titre'], lienVideo: u['lien_video'], photo: u['photo'], contenu: u['contenu'], langueId: u['langue_id'], createdAt: u['created_at'], updatedAt:u['updated_at'], deletedAt:u['deleted_at'])
            );
      }
    } else {
    debugPrint('getTemoignages has error');
    }
  }
  static Future getLangues() async {
    final response = await http.get(Uri.parse('${Apilink.url}langues'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datax = data['data'];
      for (var u in datax) {
        PkpDatabase.instance.insertLangue(
          LangueModel(id: u['id'], libelle: u['libelle'], initial: u['initial'], createdAt: u['created_at'], updatedAt: u['updated_at'], deletedAt:u['deleted_at'])
            );
      }
    } else {
    debugPrint('getLangues has error');
    }
  }
  static Future getCantique() async {
    final response = await http.get(Uri.parse('${Apilink.url}cantiques'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datax = data['data'];
      for (var u in datax) {
        PkpDatabase.instance.insertCantiques(
          ModelCantiques(id: u['id'], titre: u['titre'], lienAudio: u['lien_auio'], nomFichier: u['nom_fichier'], contenu: u['contenu'], duree: u['duree'], langueId: u['langue_id'], userId: u['user_id'], createdAt: u['created_at'], updatedAt: u['updated_at'], deletedAt: u['deleted_at'], langue: u['langue'])
            );
      }
    } else {
    debugPrint('getCantique has error');
    }
  }

  
}
