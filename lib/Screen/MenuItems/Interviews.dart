// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class IntervewsV extends StatefulWidget {
  const IntervewsV({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<IntervewsV> createState() => IntervewsVState();
}

class IntervewsVState extends State<IntervewsV> {
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
      body:ListView.builder(
        itemCount: 21,
        itemBuilder:((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height:110,
             decoration:BoxDecoration(
               color:Colors.white70,
               borderRadius:BorderRadius.circular(10),
             ),
            ),
          );
        }),
      ),
    );
  }
}