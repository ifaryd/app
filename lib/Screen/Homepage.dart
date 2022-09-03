// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pkp_android_app/const.dart';
class Homepage extends StatefulWidget {
final langue;
 const Homepage({Key? key, this.langue}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
    int indexclicked=0;
  Function updateState(int index){
  return (){
    setState(() {
      indexclicked=index;
      print("object");
    });
   // Navigator.pop(context);
  };
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData.light(),
      home:  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:AppBar(
          backgroundColor: AppColor.blackcolor2,
          title:const Text('Livre du prohète Kacou Philippe',style:TextStyle(fontSize:18),),
          bottom:const TabBar(
            tabs: [
              Tab(text:'Livre',icon:Icon(Icons.menu_book_rounded,size: 20,),),
              Tab(text:'Audio',icon:Icon(Icons.mic,size: 20,),),
              Tab(text:'Lire',icon:Icon(Icons.touch_app,size: 20,),)
            ],
          ),
        ),
        body:TabBarView(  
          children: [
           /*  LivrePkp(langue:widget.langue,),
            AudioPkp(langue:widget.langue,),
            SermPkp(langue:widget.langue,), */
          ],
        )
      ),
    ),
    );
   
  }
}
