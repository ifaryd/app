// ignore_for_file: file_names

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkp_android_app/model/versets.dart';

import '../Dbmanage/sqfliteDb.dart';

class PredPages extends StatefulWidget {
  const PredPages({Key? key, required this.title,required this.idx}) : super(key: key);
  final String title;
  final int idx;
  
  @override
  State<PredPages> createState() => PredPagesState();
}

class PredPagesState extends State<PredPages> {
bool load =true;
 Future<List<ModelVerset>>? verset;
  @override
  void initState() {
    print('index pred :${widget.idx}');
    super.initState();
    PkpDatabase.instance.initDB().whenComplete((){
      setState(() {
        verset=getverset();
        load=false;
      });
    });
  }
  Future<List<ModelVerset>> getverset()async{
  return  await PkpDatabase.instance.listVerset(idx:widget.idx);
  }
  @override
  Widget build(BuildContext context) {
   double widht=MediaQuery.of(context).size.width;
    return Scaffold(
     /*  appBar: AppBar(
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
      ), */
      body:NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
         return [
            SliverAppBar(
            floating: true,
            snap: true,
            title:Text(widget.title),
            centerTitle: true,
               actions: [
         Padding(
           padding: const EdgeInsets.only(right:0.0),
           child: PopupMenuButton(
             shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)),
             icon:Icon(CupertinoIcons.ellipsis,size:30,),
             constraints:BoxConstraints.tightForFinite(width:65),
             position:PopupMenuPosition.under,
             itemBuilder:((context) => [
               PopupMenuItem(value:2,child:IconButton(onPressed:(){
                 showSearch(context: context, 
                 delegate: Myserachdelegate(),
                 );
               }, icon:Icon(Icons.search_outlined))),
                              PopupMenuItem(value:0, child:IconButton(onPressed:(){}, icon:Icon(Icons.copy_all))),

               PopupMenuItem(value:3,child:IconButton(onPressed:(){}, icon:Icon(Icons.download))),
               PopupMenuItem(value:4,child:IconButton(onPressed:(){}, icon:Icon(CupertinoIcons.volume_up))),
             ]),
           ),
         )
         
        ],
            
          )
          ];
        }), 
        body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width:widht*1.8,
                  child:Text(widget.title,textAlign:TextAlign.center,style:TextStyle(fontSize:32,fontWeight:FontWeight.bold),),
                ),
              ),
            ),
          FutureBuilder(
            
            future: verset,
            builder:((BuildContext context, AsyncSnapshot<List<ModelVerset>> snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return CircularProgressIndicator(color:Colors.blue,);
              }else{
                if(snapshot.hasError){
                  return Text("Error ${snapshot.error}");
                }else{
                  final items= snapshot.data ?? <ModelVerset>[];
                  return (items.isNotEmpty)? 
                  ListView.builder(
                    shrinkWrap: true,
                    physics:NeverScrollableScrollPhysics(),
                    itemCount:items.length,
                    itemBuilder:((context, index) {
                      return DelayedDisplay(
                        
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SelectableText('${items[index].numero}.  ${items[index].contenu}',style:TextStyle(fontSize:17,height:1.5),),
                        )
                      );
                    }),
                  ):Text("Aucun versets pour cettes prédications");
                }
              }
            }),
          )
          ],
        ),
      )
        )
    );
  }
}

class Myserachdelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
             IconButton(onPressed:(){
               if(query.isEmpty){
                  close(context, null);
               }else{
                 query='';
               }
             }, icon:Icon(Icons.close))

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed:(){
      Navigator.pop(context);
    }, icon:Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
        return Container();

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> sugest=[
      'test'
    ];
    return ListView.builder(
      itemCount:sugest.length,
      itemBuilder:((context, index) {
        final sug=sugest[index];

        return ListTile(
          onTap:(){
            query=sug;
          },
          title:Text(sug),);
      }),
    );
  }
  
}
