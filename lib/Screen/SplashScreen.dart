// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:pkp_android_app/Screen/langue.dart';

import 'Homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacementNamed('choselanguage');
      /* Navigator.of(context).pushReplacement(PageAnimationTransition(
          page: const Langue(), pageAnimationType: RightToLeftTransition())); */
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('lib/Images/pkp_spl.jpg'),
              radius: 90,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Prophète Kacou Philippe",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Les seules vrai paroles de Dieu pour notre temps",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
