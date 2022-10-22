// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkp_android_app/model/pays.dart';
import 'package:pkp_android_app/model/temoignages.dart';

import '../../Dbmanage/sqfliteDb.dart';
import '../../const.dart';

class Temoignages extends StatefulWidget {
  const Temoignages({Key? key, required this.title, required this.idx}) : super(key: key);
  final String title;
  final int idx;
  @override
  State<Temoignages> createState() => TemoignagesState();
}

class TemoignagesState extends State<Temoignages> {
  Future<List<ModelTemoignages>>? getpays;
  bool load = true;

  @override
  void initState() {
    print("object");
    super.initState();

    PkpDatabase.instance.initDB().whenComplete(() {
      setState(() {
        getpays = getpayslist();
        load=false;
      });
    });
  }

  Future<List<ModelTemoignages>> getpayslist() async {
    return await PkpDatabase.instance.listTemoignage(idx:widget.idx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CupertinoIcons.back,
              )),
        ),
        body: (load)
            ? Center(child: CircularProgressIndicator())
            : FutureBuilder(
                future: getpays,
                builder: ((context, AsyncSnapshot<List<ModelTemoignages>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: Colors.blue,
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Text("Error sqflite");
                    } else {
                      final items = snapshot.data ?? <ModelTemoignages>[];
                      return (items.isNotEmpty)
                          ? ListView.separated(
                              itemCount: items.length,
                              separatorBuilder: ((context, index) {
                                return Divider();
                              }),
                              itemBuilder: ((context, index) {
                                return ListTile(
                                  title:Text(snapshot.data![index].titre.toString()),
                                 // trailing:Icon(Icons.)
                                );
                              }),
                            )
                          : Center(
                              child:
                                  Text('Aucun pays dans la base de données'));
                    }
                  }
                }),
              ));
  }
}
