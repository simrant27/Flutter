import 'package:day_09/fruits.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Day_09());
}

class Day_09 extends StatelessWidget {
  const Day_09({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Fruits(),
    );
  }
}
