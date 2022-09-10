// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class photos extends StatefulWidget {
  const photos({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<photos> createState() => photosState();
}

class photosState extends State<photos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor:AppColor.whitecolor,

        appBar: AppBar(
        backgroundColor: AppColor.appbar,
        title: Text(
          widget.title,
          style: TextStyle(color: AppColor.text),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: AppColor.text,
            )),
      ),
      body:Center(child:Text("Indisponible pour le moment",style:TextStyle(color:AppColor.blackcolor,fontSize:20),),),
    );
  }
}