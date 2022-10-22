// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkp_android_app/model/pays.dart';

import '../../Dbmanage/sqfliteDb.dart';
import '../../const.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Contacts> createState() => ContactsState();
}

class ContactsState extends State<Contacts> {
  Future<List<Paysmodel>>? getpays;
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

  Future<List<Paysmodel>> getpayslist() async {
    return await PkpDatabase.instance.listepays();
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
                builder: ((context, AsyncSnapshot<List<Paysmodel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: Colors.blue,
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Text("Error sqflite");
                    } else {
                      final items = snapshot.data ?? <Paysmodel>[];
                      return (items.isNotEmpty)
                          ? ListView.separated(
                              itemCount: items.length,
                              separatorBuilder: ((context, index) {
                                return Divider();
                              }),
                              itemBuilder: ((context, index) {
                                return ListTile(
                                  title:Text(snapshot.data![index].nom),
                                  trailing:Text(snapshot.data![index].sigle),
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
