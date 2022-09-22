// ignore_for_file: file_names

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pkp_android_app/Dbmanage/dbmanage.dart';
import 'package:pkp_android_app/Screen/predPage.dart';
import 'package:pkp_android_app/model/predications.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LivrePkp extends StatefulWidget {
  final String title;
  const LivrePkp({Key? key, required this.title}) : super(key: key);
  @override
  State<LivrePkp> createState() => _LivrePkpState();
}

class _LivrePkpState extends State<LivrePkp> {
  int predindex = 0;
  tap(int idx) {
    setState(() {
      predindex = idx;
    });
  }
  List<classPredications>? predList;
  Iterable<classPredications>? revList;
  bool load=true;
  getallPred()async{
    predList= await Dbmanage().getPred();
    revList=predList!.reversed;
    print('list num :${predList!.length}');
   setState(() {
      load=false;
   });
  }
  final ItemScrollController itemScrollController = ItemScrollController();
  final itemkey=GlobalKey();
  Future scrollDown(int index)async{
   itemScrollController.jumpTo(
     index:index,
     );
  }
  final Duration initialDelay = Duration(milliseconds:50);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
       setState(() {
      getallPred();
    });
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
                  scrollDown(predList!.length-304);
                });
              }, icon: Icon(Icons.keyboard_double_arrow_down_sharp))
            ],
      ),
      body:(load)? Center(child:CircularProgressIndicator.adaptive(),): Padding(
        padding: const EdgeInsets.only(left:1.0),
        child: ScrollablePositionedList.separated(
          itemScrollController: itemScrollController,
          separatorBuilder: (BuildContext context, int index) => const Divider(
          ),
          itemCount: (revList!.length)-304,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => PredPages())));
              },
              child: DelayedDisplay(
                delay:initialDelay ,
                child: ListTile(
                  style:ListTileStyle.list,
                  title:Text(
                    "Kacou ${predList![index].id} : ${predList![index].titre}",style:TextStyle(fontSize:16,fontWeight:FontWeight.bold),
                   
                  ),
                  trailing: Icon(
                    CupertinoIcons.right_chevron,
                    size:20,
                  ),
                  subtitle: Text(
                    predList![index].sous_titre.toString(),
                    style: TextStyle(
                     fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}