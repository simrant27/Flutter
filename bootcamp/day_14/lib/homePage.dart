import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'counterChange.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int counter = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CounterChange(
              onChangeValue: (v) {
                // print(v);
                setState(() {
                  counter = v;
                });
              },
            ),
            Divider(
              thickness: 5,
              color: Colors.black,
            ),
            ShowValue(counter: counter),
          ],
        ),
      ),
    );
  }
}

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
