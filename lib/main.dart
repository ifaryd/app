import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pkp_android_app/Dbmanage/localDb.dart';
import 'package:pkp_android_app/const.dart';

import 'Dbmanage/sqfliteDb.dart';
import 'Screen/Choix_Lang.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PkpDatabase.internal().database;
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  //..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.appbar,
          ),
          brightness: Brightness.light,
          primarySwatch: Colors.grey,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Color.fromARGB(169, 33, 149, 243),
            ),
          ),
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Color.fromARGB(169, 33, 149, 243),
            ),
          ),
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              darkTheme: darkTheme,
              routes: {
                //'/':((context) => const SplashScreen()),
                '/': ((context) => const ChoixLangue()),
              },
                builder: EasyLoading.init(),
            ));
  }
}
