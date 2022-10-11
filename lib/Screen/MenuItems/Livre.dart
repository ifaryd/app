// ignore_for_file: file_names

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkp_android_app/Screen/predPage.dart';
import 'package:pkp_android_app/model/predications.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../Dbmanage/sqfliteDb.dart';

class LivrePkp extends StatefulWidget {
  final String title;
  const LivrePkp({Key? key, required this.title}) : super(key: key);
  @override
  State<LivrePkp> createState() => _LivrePkpState();
}

class _LivrePkpState extends State<LivrePkp> {

  final ItemScrollController itemScrollController = ItemScrollController();
  final itemkey=GlobalKey();
  Future scrollDown(int index)async{
   itemScrollController.jumpTo(
     index:index,
     );
  }
  final Duration initialDelay = Duration(milliseconds:50);
  Future<List<ModelPredications>>? predications;
  bool load=false;
  int down=0;
  btndown(){
    setState(() {
                 scrollDown(down);
                });
  }
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    PkpDatabase.instance.initDB().whenComplete((){
      setState(() {
        predications=getpreds();
      });
    });
  }
  Future<List<ModelPredications>> getpreds() async{
   return await PkpDatabase.instance.listPred();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        leading: IconButton(
          splashRadius:1,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
            )),
            actions: [
               IconButton(onPressed:(){
                setState(() {
                  scrollDown(0);
                });
              }, icon: Icon(Icons.keyboard_double_arrow_up_outlined)),
              IconButton(onPressed:(){
                setState(() {
                   scrollDown(152);
            });
              }, icon: Icon(Icons.keyboard_double_arrow_down_sharp))
            ],
      ),
      body:(load)? Center(child:CircularProgressIndicator.adaptive(),): Padding(
        padding: const EdgeInsets.only(left:1.0),
        child: FutureBuilder(
          future: predications,
          builder:((BuildContext context, AsyncSnapshot<List<ModelPredications>> snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator(color:Colors.blue,);
            }else{
              if(snapshot.hasError){
              return  Text("Error sqflite");
              }else{
                final items=snapshot.data ?? <ModelPredications>[];
                return (items.isNotEmpty)? 
                ScrollablePositionedList.separated(
          itemScrollController: itemScrollController,
          separatorBuilder: (BuildContext context, int index) => const Divider(
          ),
          itemCount: (items.length),
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            
            return InkWell(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => PredPages(title:'${items[index].chapitre} : ${items[index].titre}',idx:items[index].numero,))));
              },
              child: DelayedDisplay(
                delay:initialDelay ,
                child: ListTile(
                  style:ListTileStyle.list,
                  title:Text(
                    "${items[index].chapitre} : ${items[index].titre}",style:TextStyle(fontSize:16,fontWeight:FontWeight.bold),textAlign:TextAlign.center,
                   
                  ),
                  trailing: Icon(
                    CupertinoIcons.right_chevron,
                    size:20,
                  ),
                  subtitle: Text(
                    items[index].sousTitre.toString(),
                    style: TextStyle(
                     fontStyle: FontStyle.italic,fontSize:13),
                  ),
                ),
              ),
            );
          }),
        ): Text("Aucun versets disponible pour cette prédications");
              }
            }
          }),
        )
      ),
    );
  }
}