import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pkp_android_app/Screen/MenuItems/Language/Langues.dart';
import 'package:pkp_android_app/model/assemblees.dart';
import 'package:pkp_android_app/model/langues.dart';
import 'package:pkp_android_app/model/pays.dart';
import 'package:pkp_android_app/model/predications.dart';

import '../HostLink/HostLink.dart';

class Dbmanage {
  List<LangueModel> langFromJson(String jsonString) {
    //Fonction qui recupere la sorti Json pour les faits sortir un par un
    final data = jsonDecode(jsonString);
    return List<LangueModel>.from(
        data.map((item) => LangueModel.fromJson(item)));
  }

  List<classPredications> predFromJson(String jsonString) {
    //Fonction qui recupere la sorti Json pour les faits sortir un par un
    final data = jsonDecode(jsonString);
    return List<classPredications>.from(
        data.map((item) => classPredications.fromMap(item)));
  }

  List<ClassAssemblees> contactFromJson(String jsonString) {
    //Fonction qui recupere la sorti Json pour les faits sortir un par un
    final data = jsonDecode(jsonString);
    return List<ClassAssemblees>.from(
        data.map((item) => ClassAssemblees.fromMap(item)));
  }

  List<Classpays> paysFromJson(String jsonString) {
    //Fonction qui recupere la sorti Json pour les faits sortir un par un
    final data = jsonDecode(jsonString);
    return List<Classpays>.from(data.map((item) => Classpays.fromMap(item)));
  }

  /* Future<List<LangueModel>> getLangue() async {
    final response = await http.post(Uri.parse('http://192.168.43.208:8000/api/langues'));
    if (response.statusCode == 200) {
      final List<LangueModel> list = langFromJson(response.body);
      return list;
    } else {
      return <LangueModel>[];
    }
  } */

  Future<List<LangueModel>> AllLangue() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.43.208:8000/api/langues'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var datax = data['data'];
        print("Datlangues=>$datax");
        final List<LangueModel> list = langFromJson(datax);
        return list;
      } else {
        return Future.error(response.statusCode);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  List<classPredications> list = [];
   Future<List<classPredications>> getPred() async {
    final response = await http.post(Uri.parse('http://192.168.1.13/pkp_db/predi.php'));
    if (response.statusCode == 200) {
      print('Predication trouvé');
      final List<classPredications> list = predFromJson(response.body);
      return list;
    } else {
      return <classPredications>[];
    }
  }

  Future<List<Classpays>> getPays() async {
    final response = await http.post(Uri.parse('${Hostconfig.url}pays.php'));
    if (response.statusCode == 200) {
      final List<Classpays> list = paysFromJson(response.body);
      return list;
    } else {
      return <Classpays>[];
    }
  }

  Future<List<ClassAssemblees>> getContact() async {
    final response = await http.post(Uri.parse('${Hostconfig.url}contact.php'));
    if (response.statusCode == 200) {
      final List<ClassAssemblees> list = contactFromJson(response.body);
      return list;
    } else {
      return <ClassAssemblees>[];
    }
  }
}
