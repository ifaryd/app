import 'package:flutter/material.dart';

import '../../const.dart';
class appDraw extends StatefulWidget {
  const appDraw({Key? key, required this.langue,}) : super(key: key);
  final String langue;
  @override
  State<appDraw> createState() => _appDrawState();
}

class _appDrawState extends State<appDraw> {
    int indexclicked=0;
  Function updateState(int index){
  return (){
    setState(() {
      indexclicked=index;
      print("object");
    });
  //  Navigator.pop(context);
  };
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.whitecolor,
      child: Column(
        children: [
          SizedBox(height:40),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("Langue"),
            trailing: TextButton.icon(
                onPressed:(){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.flag),
                label: Text(widget.langue)),
            onTap: () => null,
          ),
          Divider(),
          Expanded(
            child:ListView(
              padding:EdgeInsets.zero,
              children: [
                AppBarTile(indexclicked:indexclicked, index:0,onTap:updateState(0),title:'Livre',icon:Icons.menu_book_outlined,),
                AppBarTile(indexclicked:indexclicked,index:1,onTap:updateState(1),title:'Interviews Videos',icon:Icons.video_collection_outlined),
                AppBarTile(indexclicked:indexclicked,index:2,onTap:updateState(2),title:'Biographie',icon:Icons.person_outline),
                AppBarTile(indexclicked:indexclicked,index:3,onTap:updateState(3),title:'Photos',icon:Icons.photo_album_outlined,),
                AppBarTile(indexclicked:indexclicked,index:4,onTap:updateState(4),title:'Cantiques & Louanges',icon:Icons.my_library_music_outlined,),
                AppBarTile(indexclicked:indexclicked,index:5,onTap:updateState(5),title:'Serviteurs Fidèles',icon:Icons.people,),
                AppBarTile(indexclicked:indexclicked,index:6,onTap:updateState(6),title:'Témoignages',icon:Icons.message_outlined,),
                AppBarTile(indexclicked:indexclicked,index:7,onTap:updateState(7),title:'Contact',icon:Icons.phone,),
                AppBarTile(indexclicked:indexclicked,index:8,onTap:updateState(8),title:'Mise à jour',icon:Icons.update,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class AppBarTile extends StatelessWidget {
  const AppBarTile({
    Key? key,
    required this.indexclicked,
    required this.index,
      required this.icon,
      required this.onTap,
      required this.title
  }) : super(key: key);

  final int indexclicked;
   final int index;
  final String title;
  final Function onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:(){onTap();},
      leading: Icon(
        icon,
        color: indexclicked == index ? Colors.blue : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: indexclicked == index ? Colors.blue : null,
        ),
      ),
    );
  }
}