import 'package:a_day_09/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Day09());
}

class Day09 extends StatefulWidget {
  const Day09({super.key});

  @override
  State<Day09> createState() => _Day09State();
}

class _Day09State extends State<Day09> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
