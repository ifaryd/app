// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../const.dart';

class AudioPkp extends StatefulWidget {
  const AudioPkp({Key? key}) : super(key: key);
  @override
  State<AudioPkp> createState() => _AudioPkpState();
}

class _AudioPkpState extends State<AudioPkp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whitecolor,
      child: Center(
          child: Text(
        "Audio",
        style: const TextStyle(fontSize: 22),
      )),
    );
  }
}
