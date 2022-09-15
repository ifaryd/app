// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Contacts> createState() => ContactsState();
}

class ContactsState extends State<Contacts> {
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
      body:Center(child:Text("Indisponible pour le moment",style:TextStyle(fontSize:20),),),
    );
  }
}