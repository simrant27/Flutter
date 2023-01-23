import 'package:a_http_basics_11/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Day11());
}

class Day11 extends StatefulWidget {
  const Day11({super.key});

  @override
  State<Day11> createState() => _Day11State();
}

class _Day11State extends State<Day11> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
