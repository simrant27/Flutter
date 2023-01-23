import 'package:flutter/material.dart';

class CounterChange extends StatefulWidget {
  void Function(int) onChangeValue;
  CounterChange({super.key, required this.onChangeValue});

  @override
  State<CounterChange> createState() => _CounterChangeState();
}

class _CounterChangeState extends State<CounterChange> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          onPressed: (() {
            counter = counter + 1;
            setState(() {});
            widget.onChangeValue(counter);
          }),
          child: Icon(Icons.add),
        ),
        Text(
          counter.toString(),
          style: TextStyle(fontSize: 24),
        ),
        FloatingActionButton(
            onPressed: () {
              counter = counter - 1;
              setState(() {});
              widget.onChangeValue(counter);
            },
            child: Text("-"))
      ],
    );
  }
}
