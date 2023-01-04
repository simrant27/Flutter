import 'package:flutter/material.dart';

void main() {
  runApp(const Day2());
}

class Day2 extends StatelessWidget {
  const Day2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.black,
                  width: 10,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(-30, 30),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.red.withOpacity(0.5),
                    offset: const Offset(30, -30),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
