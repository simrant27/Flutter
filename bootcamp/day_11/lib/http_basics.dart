import 'dart:convert';

import 'package:day_11/goPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpBasicPage extends StatefulWidget {
  const HttpBasicPage({super.key});

  @override
  State<HttpBasicPage> createState() => _HttpBasicPageState();
}

class _HttpBasicPageState extends State<HttpBasicPage> {
  String responseFromServer = "";
  List parseData = [];
  @override
  void initState() {
    getDataFromInternet();
    super.initState();
  }

  Future<void> getDataFromInternet() async {
    var data =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    // print(data.body);

    setState(() {
      responseFromServer = data.body;
    });

    print(data.body.runtimeType);

    parseData = jsonDecode(data.body);
    print(parseData.runtimeType);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            //     child: ListView(
            //   children: [
            //     Text("Respond From Server"),
            //     Text(responseFromServer),
            //   ],
            // ),
            child: ListView(
          children: parseData.map((e) {
            return ListTile(
              title: Text(e["title"]),
              subtitle: Text("${e["userId"]}"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return GoPage(
                    titleOfPage: e["title"],
                    bodyOfPage: e["body"],
                  );
                })));
              },
            );
          }).toList(),
        )),
      ),
    );
  }
}
