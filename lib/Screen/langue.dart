import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:pkp_android_app/const.dart';
import 'drawpage.dart';

class Langue extends StatefulWidget {
  const Langue({Key? key}) : super(key: key);

  @override
  State<Langue> createState() => _LangueState();
}

class _LangueState extends State<Langue> {
  bool download = false;
  final langue = [
    ['English', false],
    ['Francais', false],
    ['Espagnol', false],
    ['Portugais', false],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.greycolor2,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.whitecolor2,
          title: const Text('Langue',
              style: TextStyle(color: AppColor.blackcolor2)),
          centerTitle: true,
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Actualiser',
                  style: TextStyle(color: AppColor.blackcolor, fontSize: 15),
                ))
          ],
          automaticallyImplyLeading: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text("SELECTIONNER LA LANGUE DE LA BASE DE DONNEES",
                  style: TextStyle(color: AppColor.text, fontSize: 13)),
            ),
            SizedBox(height: 3),
            Container(
              color: AppColor.whitecolor,
              height: 215,
              child: Column(
                children: [
                  Expanded(
                  //  flex: 1,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: 4,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        color: AppColor.blackcolor,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            if (langue[index][1] == true) {
                              Navigator.of(context).push(PageAnimationTransition(
                                  page: Drawpage(),
                                  pageAnimationType:RightToLeftTransition()));
                            }
                            else
                            {
                              //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Telecharger la langue dbd'),backgroundColor:Colors.amber,));
                              showDialog(
                                barrierDismissible:true,
                                context: context,
                                builder: ((context) {
                                  return AlertDialog(
                                    backgroundColor:AppColor.whitecolor,
                                    title:Text("Téléchargement",style:TextStyle(color:AppColor.blackcolor2),),
                                    content:Column(
                                      mainAxisSize:MainAxisSize.min,
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: const [
                                        Text('Télécharger la langue de la base de données avant de continuer',style:TextStyle(color:AppColor.blackcolor2),),
                                        SizedBox(height:5),
                                        Text('Voulez-vous télécharger cette langue ?',style:TextStyle(color:AppColor.blackcolor2),),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(onPressed:(){}, child:Text('Annuler')),
                                      TextButton(onPressed:(){}, child:Text('Télécharger')),
                                    ],
                                  );
                                })
                                );
                            }
                          },
                          child: SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      (langue[index][1] == true)
                                          ? Padding(
                                            padding: const EdgeInsets.only(left:8.0),
                                            child: Icon(
                                                CupertinoIcons.check_mark,
                                                semanticLabel:'check',
                                                color: AppColor.blackcolor2,
                                                size: 18,
                                              ),
                                          )
                                          : Text(''),
                                      SizedBox(width: 2),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal:15.0,vertical:8.0),
                                        child: Text(
                                          langue[index][0].toString(),
                                          style: TextStyle(
                                              color: AppColor.blackcolor2,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      (langue[index][1] == false)
                                          ? Row(
                                              children: [
                                                Text(
                                                  "Nouveau",
                                                  style: TextStyle(
                                                      color: AppColor.blackcolor,
                                                      fontSize:12,
                                                      ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      langue[index][1] = true;
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.file_download_outlined,
                                                    size:27,
                                                    color: AppColor.blackcolor,
                                                  ),
                                                )
                                              ],
                                            )
                                          : Text(''),
                                      SizedBox(width: 10),
                                      Icon(
                                        CupertinoIcons.exclamationmark_circle,
                                        color: AppColor.blackcolor,
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  )
                                ],
                              )),
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
        )
        );
  }
}
