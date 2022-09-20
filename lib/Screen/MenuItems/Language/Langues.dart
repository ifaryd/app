// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Dbmanage/dbmanage.dart';
import '../../../const.dart';
import '../../../model/langues.dart';

class Langues extends StatefulWidget {
  const Langues({super.key});

  @override
  State<Langues> createState() => _LanguesState();
}

class _LanguesState extends State<Langues> {
   
  List<ClassLangues> prestList=[];
  bool loading=true;
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
              padding: const EdgeInsets.only(left: 15.0),
              child: Text("TELECHARGER LA LANGUE DE LA BASE DE DONNEES",
                  style: TextStyle(color: AppColor.text, fontSize: 13)),
            ),
            SizedBox(height: 3),
            SizedBox(
              height: 300,
              child: Column(
                children: [
                  Expanded(
                    child:(loading)? Center(child: CircularProgressIndicator(color:Colors.blue,),): ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount:prestList.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading:Icon(CupertinoIcons.check_mark),
                          title:Text(prestList[index].libelle.toString()),
                          subtitle:Text(prestList[index].initial.toString()),

                          trailing:IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.arrow_down_to_line)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                //flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15.0,vertical:8.0),
                  child: Text(
                    'Choisir la langue de la base de données et de l\'utilisation de l\'application, Télécharger d\'abord la base de données. Appuyer sur le bouton de téléchargement pour démarrer le téléchargement. S\'il y\'a une mise à jour le bouton de téléchargement réapparaîtra de nouveau.',
                    style: TextStyle(color: AppColor.text,fontSize:15),
                  ),
                )),
          ],
        );
  }
}