import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:pkp_android_app/Dbmanage/dbmanage.dart';
import 'package:pkp_android_app/const.dart';

import 'Screen/Choix_Lang.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PkpDatabase.instance.database;
  runApp(const MyApp());
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
              backgroundColor: Color.fromARGB(169, 33, 149, 243),
            ),
          ),
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(169, 33, 149, 243),
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
            ));
  }
}
