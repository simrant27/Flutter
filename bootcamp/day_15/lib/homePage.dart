import 'package:day_14/switch.dart';
import 'package:day_14/textEntered.dart';

import 'package:day_14/textWritten.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SwitchColor(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextEntered(),
            Divider(
              thickness: 5,
              color: Colors.black,
            ),
            TextWritten(),
          ],
        ),
      ),
    );
  }
}
