import 'package:day_08/circle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Day_08());
}

List<Map<dynamic, dynamic>> centerCircle = [
  {
    "radius": 120.0,
    "color": Colors.blue,
  },
  {
    "radius": 80.0,
    "color": Colors.red,
  },
  {
    "radius": 40.0,
    "color": Colors.yellow,
  },
];

List<Map<dynamic, dynamic>> petals = [
  {
    "right": 88.0,
    "top": 400.0,
    "color": Colors.pink,
  },
  {
    "right": 58.0,
    "top": 328.0,
    "color": Colors.pink,
  },
  {
    "right": 88.0,
    "top": 254.0,
    "color": Colors.pink,
  },
  {
    "right": 164.0,
    "top": 228.0,
    "color": Colors.pink,
  },
  {
    "right": 234.0,
    "top": 264.0,
    "color": Colors.pink,
  },
  {
    "right": 256.0,
    "top": 340.0,
    "color": Colors.pink,
  },
  {
    "right": 220.0,
    "top": 406.0,
    "color": Colors.pink,
  },
  {
    "right": 148.0,
    "top": 424.0,
    "color": Colors.pink,
  }
];

class Day_08 extends StatelessWidget {
  const Day_08({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Stack(
              children: [
                for (var ci in centerCircle)
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Circle(
                        radius: ci["radius"],
                        colorOfCircle: ci["color"],
                      ),
                    ),
                  ),
                for (var petal in petals)
                  Positioned(
                    top: petal["top"],
                    right: petal["right"],
                    child: Container(
                      child: Circle(
                        radius: 80,
                        colorOfCircle: petal["color"],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
