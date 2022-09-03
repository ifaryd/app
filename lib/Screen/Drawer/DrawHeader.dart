import 'package:flutter/material.dart';
import 'package:pkp_android_app/const.dart';

class DrawHeader extends StatefulWidget {
  const DrawHeader({Key? key}) : super(key: key);

  @override
  State<DrawHeader> createState() => _DrawHeaderState();
}

class _DrawHeaderState extends State<DrawHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:AppColor.bluecolor,
      width: double.infinity,
      height:200,
      padding:const EdgeInsets.only(top:25.0),
      child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Container(
            margin:const EdgeInsets.only(bottom:10),
            height:100,
            decoration:const BoxDecoration(
          //    shape:BoxShape.circle,
              image:DecorationImage(
                image:AssetImage('lib/Images/splash.jpg')
              )
            ),
          ),
          const Text("Livre du prophète Kacou Philippe",style:TextStyle(color:Colors.white,fontSize:18),),
        ],
      ),
    );
  }
}