import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Day06());
}

class Day06 extends StatefulWidget {
  const Day06({super.key});

  @override
  State<Day06> createState() => _Day06State();
}

class _Day06State extends State<Day06> {
  List<String> fruits = [
    'Asmu',
    'Apple',
    'Orange',
    'Strawberry',
    'Kiwi',
    'Avacado'
  ];
  List<String> vegetable = ['Spanich', 'Potato', 'Cauliflower'];
  @override
  Widget build(BuildContext context) {
    // var combinedList = [...fruits, ...vegetable];
    return MaterialApp(
      home: Scaffold(
        //with returning ListTile
        body: ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (context, i) {
            print("Builing ${fruits[i]}");
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: ListTile(
                onTap: () {
                  print("Clicked on " + fruits[i]);
                  fruits.insert(0, fruits[i]);
                  fruits.add(fruits[i + 1]);
                  print(fruits);
                  setState(() {});
                },
                title: Text(
                  fruits[i],
                  // style: TextStyle(
                  //   fontSize: ,
                  // ),
                ),
              ),
            );
          },
        ),

        // with returning text
        // body: ListView.builder(
        //    itemCount: combinedList.length,
        //     itemBuilder: (context, i) {
        //       return (Text(
        //         (i + 1).toString() + " " + combinedList[i],
        //         style: TextStyle(
        //           fontSize: 24,
        //         ),
        //       ));
        //     } ),
      ),
      //     body: ListView(
      //   children: [
      //     ListTile(
      //       title: Text("Asmu"),
      //     ),
      //     ListTile(
      //       title: Text("Orange"),
      //     ),
      //     ListTile(
      //       title: Text("DragonFruit"),
      //     ),
      //     ListTile(
      //       title: Text("Orange"),
      //     ),
      //     ListTile(
      //       title: Text("Strawberry"),
      //     ),
      //     ListTile(
      //       title: Text("Orange"),
      //     ),
      //     ListTile(
      //       title: Text("Guava"),
      //     ),
      //     ListTile(
      //       title: Text("Orange"),
      //     ),
      //     ListTile(
      //       title: Text("Mango"),
      //     ),
      //     ListTile(
      //       title: Text("Orange"),
      //     ),
      //     ListTile(
      //       title: Text("Kiwi"),
      //     ),
      //     ListTile(
      //       title: Text("Orange"),
      //     ),
      //     ListTile(
      //       title: Text("Orange"),
      //     ),
      //     ListTile(
      //       title: Text("Apple"),
      //     ),
      //     ListTile(
      //       title: Text("Avacado"),
      //     )
      //   ],
      // ),
      // ),
    );
  }
}
