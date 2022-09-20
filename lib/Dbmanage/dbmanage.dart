import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:pkp_android_app/HostLink/HostLink.dart';
import 'package:pkp_android_app/model/langues.dart';

class Dbmanage{

  List<ClassLangues> langFromJson(String jsonString){ //Fonction qui recupere la sorti Json pour les faits sortir un par un
    final data=jsonDecode(jsonString);
    return  List<ClassLangues>.from(data.map((item)=>ClassLangues.fromJson(item)));
  }

  Future<List<ClassLangues>> getLangue() async{
    final response=await http.post(Uri.parse('${Hostconfig.url}/selectLang.php'));
    if(response.statusCode==200){
      final List<ClassLangues> list=langFromJson(response.body);
      return list;
    }
    else
    {
      return <ClassLangues>[];
    }
  }

}