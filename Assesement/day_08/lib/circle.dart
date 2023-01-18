import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Circle extends StatelessWidget {
  double radius;
  Color? colorOfCircle;

  Circle({super.key, required this.radius, this.colorOfCircle: Colors.red}) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(100),
        shape: BoxShape.circle,
        color: colorOfCircle,
      ),
    );
  }
}
