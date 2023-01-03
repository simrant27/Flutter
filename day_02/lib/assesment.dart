import 'package:flutter/material.dart';

void main() {
  runApp(Assesment());
}

class Assesment extends StatelessWidget {
  const Assesment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Weather Widgets"),
          centerTitle: true,
          backgroundColor: Color(0xff637CFF),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
