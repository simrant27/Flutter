import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GoPage extends StatefulWidget {
  String titleOfPage;
  String bodyOfPage;

  GoPage({super.key, required this.titleOfPage, required this.bodyOfPage});

  @override
  State<GoPage> createState() => _GoPageState();
}

class _GoPageState extends State<GoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleOfPage),
      ),
      body: Column(
        children: [
          Text("Body:"),
          Text(widget.bodyOfPage),
        ],
      ),
    );
  }
}
