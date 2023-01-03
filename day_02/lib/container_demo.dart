import 'package:flutter/material.dart';

void main() {
  runApp(ContainerDemo());
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Day 02"),
          centerTitle: true,
          backgroundColor: Color(0xff637CFF),
        ),
        body: SafeArea(
            child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            // color: Color.fromARGB(255, 240, 237, 237),
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 5,
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.6,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Card Title",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Card Subtitle",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 10,
                ),
                Text(
                    "fgfhrthretegrtrhfgfhrthretegrtrhfgfhrthretegrtrhfgfhrthretegrtrhfgfhrthretegrtrhfgfhrthretegrtrhfgfhrthretegrtrhfgfhrthretegrtrhfgfhrthretegrtrh"),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
