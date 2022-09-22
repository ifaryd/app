// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:pkp_android_app/Screen/drawpage.dart';

import '../../../Dbmanage/dbmanage.dart';
import '../../../const.dart';
import '../../../model/langues.dart';

class Langues extends StatefulWidget {
  const Langues({super.key});

  @override
  State<Langues> createState() => _LanguesState();
}

class _LanguesState extends State<Langues> {
  List<ClassLangues> prestList = [];
  bool loading = true;
  getAlllangues() async {
    prestList = await Dbmanage().getLangue();
    setState(() {
      print('lenght=${prestList.length}');
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getAlllangues();
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
          child:Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
                Text("TELECHARGER LA LANGUE DE LA BASE DE DONNEES",
              style: TextStyle(color: AppColor.text, fontSize: 13)),
              GestureDetector(
                  onTap:(){
                    setState(() {
                      loading=true;
                      getAlllangues();
                    });
                  },
                child: Text("Cliquer pour rechercher une mis à jour",style:TextStyle(color:Colors.blue),)),
            ],
          )
        ),
        SizedBox(height: 3),
        Column(
          children: [
            (loading)
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColor.blue,
                    ),
                  )
                : (prestList == null)
                    ? Center(
                        child: Text('Null'),
                      )
                    : ListView.separated(
                      shrinkWrap:true,
                        padding: EdgeInsets.zero,
                        itemCount: prestList.length,
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
                                  Text(prestList[index].libelle.toString(),style: TextStyle(fontSize:17),),
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
                      ),
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
