import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SingleCategoryPage extends StatefulWidget {
  String titleOfpage;
  // Map<String, dynamic> pageBody;
  SingleCategoryPage({super.key, required this.titleOfpage});

  @override
  State<SingleCategoryPage> createState() => _SingleCategoryPageState();
}

class _SingleCategoryPageState extends State<SingleCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleOfpage),
      ),
      // body: pageBody,
    );
  }
}
