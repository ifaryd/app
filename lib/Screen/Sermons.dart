// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../const.dart';

class SermPkp extends StatefulWidget {
  const SermPkp({Key? key,}) : super(key: key);
  @override
  State<SermPkp> createState() => _SermPkpState();
}

class _SermPkpState extends State<SermPkp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whitecolor,
      child: Center(
          child: Text(
        "Lire un sermons",
        style: const TextStyle(fontSize: 22),
      )),
    );
  }
}
