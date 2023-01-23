import 'package:day_14/switch.dart';
import 'package:day_14/textEntered.dart';

import 'package:day_14/textWritten.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEntered = TextEditingController();
  String? textToEnter = "";
  bool isSwitchOn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SwitchColor(
          isSwitch: (v) {
            isSwitchOn = v;
            setState(() {});
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextEntered(
              textToEnter: (v) {
                setState(() {
                  textToEnter = v;
                });
              },
            ),
            Divider(
              thickness: 5,
              color: Colors.black,
            ),
            TextWritten(
              textToShow: textToEnter.toString(),
              SwitchOn: isSwitchOn,
            ),
          ],
        ),
      ),
    );
  }
}
