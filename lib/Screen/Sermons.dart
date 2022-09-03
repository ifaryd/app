import 'package:flutter/material.dart';

import '../const.dart';

class SermPkp extends StatefulWidget {
  final langue;
  const SermPkp({Key? key, this.langue}) : super(key: key);
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
        "Lire un sermons en ${widget.langue}",
        style: const TextStyle(fontSize: 22),
      )),
    );
  }
}
