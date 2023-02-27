import 'package:day_15_hw_review/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Day_15_hw());
}

class Day_15_hw extends StatelessWidget {
  const Day_15_hw({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
