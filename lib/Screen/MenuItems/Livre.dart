// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkp_android_app/Screen/predPage.dart';
import 'package:pkp_android_app/const.dart';

class LivrePkp extends StatefulWidget {
  final String title;
  const LivrePkp({Key? key, required this.title}) : super(key: key);
  @override
  State<LivrePkp> createState() => _LivrePkpState();
}

class _LivrePkpState extends State<LivrePkp> {
  int predindex = 0;
  tap(int idx) {
    setState(() {
      predindex = idx;
    });
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
      body: Padding(
        padding: const EdgeInsets.only(left:10.0),
        child: ListView.separated(
          clipBehavior: Clip.none,
          separatorBuilder: (BuildContext context, int index) => const Divider(
          ),
          itemCount: 152,
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => PredPages())));
              },
              child: ListTile(
                title: Text(
                  "Kacou ${index + 1} : Titre de la prédication",
                ),
                trailing: Icon(
                  CupertinoIcons.right_chevron,
                ),
                subtitle: Text(
                  "Prophète Kacou Philippe",
                  style: TextStyle(
                   fontStyle: FontStyle.italic),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
