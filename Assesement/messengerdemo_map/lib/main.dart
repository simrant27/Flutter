import 'package:flutter/material.dart';
import 'package:messengerdemo_map/homepage.dart';

void main() {
  runApp(MessengerDemo());
}

class MessengerDemo extends StatefulWidget {
  const MessengerDemo({super.key});

  @override
  State<MessengerDemo> createState() => _MessengerDemoState();
}

class _MessengerDemoState extends State<MessengerDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.white,
      // ),
      home: HomePage(),
    );
  }
}
