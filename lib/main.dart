import 'package:flutter/material.dart';
import 'package:pkp_android_app/Screen/SplashScreen.dart';
import 'package:pkp_android_app/Screen/langue.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark(),
    //  darkTheme:ThemeData(fontFamily:),
      routes:{
        '/':((context) => const SplashScreen()),
        'choselanguage':((context) => const Langue()),
      },
    );
  }
}
