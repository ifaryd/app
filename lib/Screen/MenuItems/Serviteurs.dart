// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class ServFidl extends StatefulWidget {
  const ServFidl({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ServFidl> createState() => ServFidlState();
}

class ServFidlState extends State<ServFidl> {
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