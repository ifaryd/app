import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
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
      backgroundColor: AppColor.whitecolor,
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
      body: Padding(
        padding: const EdgeInsets.only(left:10.0),
        child: ListView.separated(
          clipBehavior: Clip.none,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: AppColor.blackcolor,
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
                  style: TextStyle(color: AppColor.blackcolor2),
                ),
                trailing: Icon(
                  CupertinoIcons.right_chevron,
                  color: AppColor.text,
                ),
                subtitle: Text(
                  "Prophète Kacou Philippe",
                  style: TextStyle(
                      color: AppColor.text, fontStyle: FontStyle.italic),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
