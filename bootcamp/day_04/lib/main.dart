import 'package:day_04/page1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Day04());
}

class Day04 extends StatelessWidget {
  const Day04({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page1(),
    );
  }
}
