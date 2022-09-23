// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkp_android_app/const.dart';

class PredPages extends StatefulWidget {
  const PredPages({Key? key}) : super(key: key);

  @override
  State<PredPages> createState() => PredPagesState();
}

class PredPagesState extends State<PredPages> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Title",
          style: TextStyle(fontSize:17),
        ),
       // centerTitle: true,
        leadingWidth: 95,
        
        leading: TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
            ),
            label: Text(
              'Retour',
            )),
        actions: [
         Padding(
           padding: const EdgeInsets.only(right:0.0),
           child: PopupMenuButton(
             shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)),
             icon:Icon(CupertinoIcons.ellipsis,size:30,),
             constraints:BoxConstraints.tightForFinite(width:65),
             position:PopupMenuPosition.under,
             itemBuilder:((context) => [
               PopupMenuItem(value:0, child:IconButton(onPressed:(){}, icon:Icon(Icons.copy_all))),
               PopupMenuItem(value:2,child:IconButton(onPressed:(){}, icon:Icon(Icons.search_outlined))),
               PopupMenuItem(value:3,child:IconButton(onPressed:(){}, icon:Icon(Icons.download))),
               PopupMenuItem(value:4,child:IconButton(onPressed:(){}, icon:Icon(CupertinoIcons.volume_up))),
             ]),
           ),
         )
         
        ],
      ),
      body: Text(''),
    );
  }
}
