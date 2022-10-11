// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:pkp_android_app/Dbmanage/localDb.dart';
import 'package:pkp_android_app/Screen/drawpage.dart';
import 'package:http/http.dart' as http;
import 'package:pkp_android_app/model/predications.dart';
import 'package:sqflite/sqflite.dart';
import '../../../Dbmanage/dbmanage.dart';
import '../../../const.dart';
import '../../../lienApi.dart';
import '../../../model/langues.dart';

class Langues extends StatefulWidget {
  const Langues({super.key});

  @override
  State<Langues> createState() => _LanguesState();
}

class _LanguesState extends State<Langues> {
  List<LangueModel> langList = [];

  Future<List<LangueModel>> getLangues() async {
    final response = await http.get(Uri.parse('${Apilink.url}langues'));
    if (response.statusCode == 200) {
      langList.removeRange(0, langList.length);
      var data = jsonDecode(response.body);
      var datax = data['data'];
      //print(datax);
      for (var u in datax) {
        LangueModel langues = LangueModel(
            id: u['id'],
            libelle: u['libelle'],
            initial: u['initial'],
            createdAt: u['createdAt'],
            updatedAt: u['updatedAt'],
            deletedAt: u['deletedAt']);
        langList.add(langues);
      }
      return langList;
    } else {
      return langList;
    }
  }

  

  Timer? _timer;
  late double _progress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("TELECHARGER LA LANGUE DE LA BASE DE DONNEES",
                    style: TextStyle(color: AppColor.text, fontSize: 13)),
                GestureDetector(
                    onTap: () {
                    //  setState(() {});
                      Navigator.push(context, MaterialPageRoute(builder:((context) {
                        return Drawpage();
                      })));
                    },
                    child: Text(
                      "Cliquer pour rechercher une mis à jour",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            )),
        SizedBox(height: 3),
        Column(
          children: [
            FutureBuilder(
              future: getLangues(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(color: Colors.blue));
                } else {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: langList.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    PageAnimationTransition(
                                        page: Drawpage(),
                                        pageAnimationType:
                                            RightToLeftTransition()));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.check),
                                      SizedBox(width: 5),
                                      Text(
                                        langList[index].libelle.toString(),
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Nouveau",
                                        style: TextStyle(
                                          color: AppColor.blue,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: ((context) {
                                                  return CupertinoAlertDialog(
                                                    title:
                                                        Text("Téléchargement"),
                                                    content: Text(
                                                        "Voulez télécharger la langue ?"),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text('NON')),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            _progress = 0;
                                                            var val = 7 / 100;
                                                            _timer?.cancel();
                                                            _timer = Timer.periodic(
                                                                const Duration(
                                                                    milliseconds:
                                                                        100),
                                                                (Timer timer) {
                                                              EasyLoading
                                                                  .showProgress(
                                                                      _progress,
                                                                      status:
                                                                          '${(_progress * 100).toStringAsFixed(0)}%');
                                                              _progress += val;

                                                              if (_progress >=
                                                                  1) {
                                                                _timer
                                                                    ?.cancel();
                                                                EasyLoading
                                                                    .dismiss();
                                                              }
                                                            });
                                                            saveSqflite
                                                                .getpays()
                                                                .whenComplete(
                                                                    () {
                                                              saveSqflite
                                                                  .getvilles()
                                                                  .whenComplete(
                                                                      () {
                                                                saveSqflite
                                                                    .getAssemblees()
                                                                    .whenComplete(
                                                                        () {
                                                                  saveSqflite
                                                                      .getTypes()
                                                                      .whenComplete(
                                                                          () {
                                                                    saveSqflite
                                                                        .getVideo()
                                                                        .whenComplete(
                                                                            () {
                                                                      saveSqflite
                                                                          .getCharge()
                                                                          .whenComplete(
                                                                              () {
                                                                       
                                                                          saveSqflite.getChargesUsers().whenComplete((){
                                                                            saveSqflite.getTemoignages().whenComplete((){
                                                                              saveSqflite.getCantique().whenComplete((){
                                                                                saveSqflite.getPreds().whenComplete((){
                                                                                   saveSqflite.getVersets().whenComplete((){
                                                                                     EasyLoading.showSuccess(
                                                                            'Great Success!');
                                                                        EasyLoading
                                                                            .dismiss();
                                                                                   });
                                                                                });
                                                                              });
                                                                            });
                                                                          });
                                                                      });
                                                                    });
                                                                  });
                                                                });
                                                              });
                                                            });
                                                          },
                                                          child: Text('OUI')),
                                                    ],
                                                  );
                                                }));
                                          },
                                          icon: Icon(
                                              Icons.file_download_outlined)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(CupertinoIcons
                                              .exclamationmark_circle)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: Text("Aucune langue dans la db"),
                    );
                  }
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
