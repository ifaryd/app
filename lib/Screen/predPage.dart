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
      backgroundColor: AppColor.whitecolor,
      appBar: AppBar(
        backgroundColor: AppColor.appbar,
        title: Text(
          "Title",
          style: TextStyle(color: AppColor.text,fontSize:17),
        ),
       // centerTitle: true,
        leadingWidth: 90,
        leading: TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: AppColor.text,
            ),
            label: Text(
              'Retour',
              style: TextStyle(color: AppColor.text),
            )),
        actions: [
         // IconButton(onPressed:(){}, icon: Icon(CupertinoIcons.ellipsis,size:30,color:AppColor.blackcolor,)),
         Padding(
           padding: const EdgeInsets.only(right:0.0),
           child: PopupMenuButton(
             shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)),
             icon:Icon(CupertinoIcons.ellipsis,size:30,color:AppColor.blackcolor,),
             color:Color.fromARGB(250, 229, 229, 232),
             constraints:BoxConstraints.tightForFinite(width:65),
             position:PopupMenuPosition.under,
             itemBuilder:((context) => [
               PopupMenuItem(value:0, child:IconButton(onPressed:(){}, icon:Icon(Icons.settings_outlined,color:AppColor.blackcolor,))),
               PopupMenuItem(value:1,child:IconButton(onPressed:(){}, icon:Icon(CupertinoIcons.exclamationmark_circle,color:AppColor.blackcolor,))),
               PopupMenuItem(value:2,child:IconButton(onPressed:(){}, icon:Icon(Icons.search_outlined,color:AppColor.blackcolor,))),
               PopupMenuItem(value:3,child:IconButton(onPressed:(){}, icon:Icon(Icons.bookmark_add_outlined,color:AppColor.blackcolor,))),
               PopupMenuItem(value:4,child:IconButton(onPressed:(){}, icon:Icon(CupertinoIcons.volume_up,color:AppColor.blackcolor,))),
             ]),
           ),
         )
         
        ],
      ),
      body: Text(''),
    );
  }
}
