import 'package:flutter/material.dart';
import 'package:messenger/homepage.dart';

void main() {
  runApp(Messenger());
}

class Messenger extends StatelessWidget {
  const Messenger({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
