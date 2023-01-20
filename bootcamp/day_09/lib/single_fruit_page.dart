import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SingleFruitPage extends StatelessWidget {
  String fruitName;
  SingleFruitPage({super.key, required this.fruitName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("This is $fruitName")),
    );
  }
}
