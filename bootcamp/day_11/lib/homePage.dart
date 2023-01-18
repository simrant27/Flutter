import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Map<String, String>> person = [
    {
      "name": "Asmite",
      "address": "Patan Hospital",
    },
    {
      "name": "Oshin",
      "address": "Pokhara",
    },
    {
      "name": "Sapana",
      "address": "USA",
    },
    {
      "name": "Rohit",
      "address": "AUS",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: ListView.builder(
        //   itemCount: person.length,
        //   itemBuilder: (context, i) {
        //     return ListTile(
        //       title: Text(person[i]["name"]!),
        //       subtitle: Text(person[i]["address"]!),
        //     );
        //   },
        // ),

        child: Column(
          children: person.map((p) {
            return ListTile(
              title: Text(p["name"]!),
              subtitle: Text(p["address"]!),
            );
          }).toList(),
        ),
      ),
    );
  }
}
