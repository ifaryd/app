// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class Biographie extends StatefulWidget {
  const Biographie({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Biographie> createState() => BiographieState();
}

class BiographieState extends State<Biographie> {
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