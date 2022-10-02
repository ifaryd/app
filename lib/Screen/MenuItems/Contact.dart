// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkp_android_app/Dbmanage/dbmanage.dart';
import 'package:pkp_android_app/model/pays.dart';

import '../../const.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Contacts> createState() => ContactsState();
}


class ContactsState extends State<Contacts> {
  List<Paysmodel>? paysList;
bool load=true;

@override
void initState() {
  print("object");
  super.initState();
 
    print('getPays');

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
      body:(load)?Center(child: CircularProgressIndicator()):
      ListView.separated(
        itemCount:paysList!.length,
        separatorBuilder:((context, index) => Divider()),
        itemBuilder:((context, index) {
          return ListTile(
            onTap:(){
              print("object");
            },
            title:Text(paysList![index].nom.toUpperCase()),
            leading:Icon(CupertinoIcons.flag),
          );
        }),
      )
    );
  }
}