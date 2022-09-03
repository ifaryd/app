import 'package:flutter/material.dart';

import '../const.dart';

class AudioPkp extends StatefulWidget {
  final langue;
  const AudioPkp({Key? key, this.langue}) : super(key: key);
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
        "Audio en ${widget.langue}",
        style: const TextStyle(fontSize: 22),
      )),
    );
  }
}
