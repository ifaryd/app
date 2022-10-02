// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class Temoignages extends StatefulWidget {
  const Temoignages({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Temoignages> createState() => TemoignagesState();
}

class TemoignagesState extends State<Temoignages> {
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