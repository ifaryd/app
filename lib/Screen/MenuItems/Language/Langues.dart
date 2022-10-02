// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:pkp_android_app/Screen/drawpage.dart';
import 'package:http/http.dart' as http;
import '../../../Dbmanage/dbmanage.dart';
import '../../../const.dart';
import '../../../model/langues.dart';

class Langues extends StatefulWidget {
  const Langues({super.key});

  @override
  State<Langues> createState() => _LanguesState();
}

class _LanguesState extends State<Langues> {
List<LangueModel> langList=[];
 Future<List<LangueModel>> getLangues()async{
    final response =  await http.get(Uri.parse('http://192.168.1.13:8000/api/langues'));
     if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var datax = data['data'];
        print(datax);
        for (var u in datax) {
          LangueModel langues=LangueModel(id: u['id'], libelle: u['libelle'], initial: u['initial'], createdAt: u['createdAt'], updatedAt: u['updatedAt'], deletedAt: u['deletedAt']);
        langList.add(langues);
        }
      return langList; 
      }else{
        return langList;
      }
 }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child:Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
                Text("TELECHARGER LA LANGUE DE LA BASE DE DONNEES",
              style: TextStyle(color: AppColor.text, fontSize: 13)),
              GestureDetector(
                  onTap:(){
                    setState(() {
                    });
                  },
                child: Text("Cliquer pour rechercher une mis à jour",style:TextStyle(color:Colors.blue),)),
            ],
          )
        ),
        SizedBox(height: 3),
        Column(
          children: [
        
                FutureBuilder(
                  future: getLangues(),
                  builder:((context, snapshot){
                    if(snapshot.hasData){
                      return ListView.separated(
                      shrinkWrap:true,
                        padding: EdgeInsets.zero,
                        itemCount:langList.length,
                        separatorBuilder:
                            (BuildContext context, int index) =>
                                const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: GestureDetector(
                              onTap: () {
                              Navigator.of(context).push(
                                  PageAnimationTransition(
                                      page: Drawpage(),
                                      pageAnimationType:
                                          RightToLeftTransition()));
                            },
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(langList[index].libelle.toString(),style: TextStyle(fontSize:17),),
                                  Row(
                                    children: [
                                      Text("Nouveau",style:TextStyle(color:AppColor.blue,),),
                                      IconButton(onPressed:(){}, icon: Icon(Icons.file_download_outlined)),
                                      IconButton(onPressed:(){}, icon: Icon(CupertinoIcons.exclamationmark_circle)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }else
                    {
                      return Center(child:Text("Aucune langue dans la db"),);
                    }
                  }),
                )
          ],
        ),
        Expanded(
            //flex: 3,
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Text(
            'Choisir la langue de la base de données et de l\'utilisation de l\'application, Télécharger d\'abord la base de données. Appuyer sur le bouton de téléchargement pour démarrer le téléchargement. S\'il y\'a une mise à jour le bouton de téléchargement réapparaîtra de nouveau.',
            style: TextStyle(color: AppColor.text, fontSize: 15),
          ),
        )),
      ],
    );
  }
}
