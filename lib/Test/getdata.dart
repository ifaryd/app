import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  List datax = [];
  Future<List> getJsondata() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.43.208:8000/api/langues'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

         datax = data['data'];
        print(datax.length);
        return datax;
      } else {
        return Future.error(response.statusCode);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Json Test'),
          centerTitle: true,
        ),
        body: FutureBuilder(
         future: getJsondata(),
          builder: ((context, snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: datax.length,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                        color: Colors.amber,
                        child: Text(datax[index]["libelle"])),
                  );
                }),
              );
            } else {
              return Center(child: Text('Data not fund'));
            }
          }),
        ));
  }
}
