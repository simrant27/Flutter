import 'package:flutter/material.dart';

class ShowValue extends StatelessWidget {
  const ShowValue({
    Key? key,
    required this.counter,
  }) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Text(
      counter.toString(),
      style: TextStyle(fontSize: 48),
    );
  }
}
