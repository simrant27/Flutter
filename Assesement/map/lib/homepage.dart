import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Map<String, dynamic>> chats = [
  //   {
  //     "name": "MJ",
  //     "profileUri": "http://xsgames.co/randomusers/assets/avatars/pixel/2.jpg",
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: Colors.white,
        //   iconTheme: IconThemeData(color: Colors.blue),
        //   title: Text(
        //     "Chats",
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 24,
        //       color: Colors.black,
        //     ),
        //   ),
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 20),
        //       child: Icon(Icons.chat_rounded),
        //     )
        //   ],
        //   elevation: 0,
        // ),
        // drawer: Drawer(),
        // body: SafeArea(
        //   child: Column(
        //     children: [
        //       ListTile(
        //         leading: Image.network(chats[0]["profileuri"]),
        //         title: Text(chats[0]["name"]),
        //       ),
        //       Image.network(
        //           "http://xsgames.co/randomusers/assets/avatars/pixel/2.jpg"),
        //     ],
        //   ),
        // ),
        );
  }
}
