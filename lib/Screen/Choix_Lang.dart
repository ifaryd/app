// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'MenuItems/Language/Langues.dart';
import 'MenuItems/Language/ethnie.dart';

class ChoixLangue extends StatefulWidget {
  const ChoixLangue({Key? key}) : super(key: key);

  @override
  State<ChoixLangue> createState() => _ChoixLangueState();
}

class _ChoixLangueState extends State<ChoixLangue> {
  bool download = false;
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:2,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Langues',
                ),
            centerTitle: true,
       
            automaticallyImplyLeading: false,
            bottom:TabBar(
              indicatorColor:Color.fromARGB(154, 33, 149, 243),
              tabs: const[
                Tab(text:'Langues'),
                Tab(text:'Ethnies'),
              ],
            )
          ),
          body: TabBarView(
            children: const[
              Langues(),
              Ethnies(),
            ],
          )
          ),
    );
  }
}
