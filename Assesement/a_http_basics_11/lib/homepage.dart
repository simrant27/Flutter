import 'dart:convert';

import 'package:a_http_basics_11/singleCategoryPage.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String response = "";
  List postData = [];
  @override
  void initState() {
    getDataFromInternet();
    super.initState();
  }

  Future<void> getDataFromInternet() async {
    var posts =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    setState(() {
      response = posts.body;
    });
    postData = jsonDecode(posts.body);
    print(response);
    var users =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var todos =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    var photos = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Browse Categories"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              // ListView.builder(
              //   itemCount: postData.length,
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       title: Text("Posts"),
              //       onTap: () {
              //         Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) =>
              //               SingleCategoryPage(titleOfpage: "sfg"),
              //         ));
              //       },
              //     );
              //   },
              // )
              ElevatedButton(onPressed: (() {}), child: Text("Users")),
              ElevatedButton(onPressed: (() {}), child: Text("Todos")),
              ElevatedButton(onPressed: (() {}), child: Text("Photos")),
            ],
          ),
        ),
      ),
    );
  }
}
