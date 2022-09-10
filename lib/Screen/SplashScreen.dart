// ignore_for_file: file_names

import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacementNamed('choselanguage');
    });
  }

  @override
  Widget build(BuildContext context) {
//  final  width=MediaQuery.of(context).size.width;
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
