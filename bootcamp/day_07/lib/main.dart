import 'package:flutter/material.dart';

void main() {
  runApp(Day07());
}

class Day07 extends StatefulWidget {
  const Day07({super.key});

  @override
  State<Day07> createState() => _Day07State();
}

class _Day07State extends State<Day07> {
  var fromLeft = 0.0;
  var fromTop = 0.0;
  int direction = 1;
  var increment = 40;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.red,
            child: Stack(children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1500),
                top: fromLeft,
                left: fromLeft,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: FlutterLogo(),
              ),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              var leftMax = 300.0 - 100.0;
              if (fromLeft > leftMax) {
                direction = direction * -1;
                fromLeft = leftMax;
              } else if (fromLeft < leftMax) {
                direction = direction * -1;
              }
              fromLeft = fromLeft + increment * direction;
            }
                // fromTop = fromTop + 5;
                );
          },
        ),
      ),
    );
  }
}
