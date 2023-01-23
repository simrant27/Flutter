import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  // Color backColor = Colors.white;
  bool isSwitchOn = false;
  bool? isCheckOn = false;
  bool? isConform = false;
  String text = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (isCheckOn! ? AppBar() : null),
      // backgroundColor: backColor,
      backgroundColor: isSwitchOn ? Colors.red : Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Change background color to red"),
              Switch(
                value: isSwitchOn,
                onChanged: (v) {
                  setState(
                    () {
                      // if (isSwitchOn) {
                      //   isSwitchOn = false;
                      // }
                      // isSwitchOn = true;
                      isSwitchOn = v;
                      // (v) ? backColor = Colors.red : backColor = Colors.white;
                    },
                  );
                  print("Switch Changed to : $v");
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Show AppBar:"),
              Checkbox(
                value: isCheckOn,
                onChanged: (value) {
                  setState(() {
                    isCheckOn = value!;
                  });
                },
              ),
            ],
          ),
          Form(
            child: TextField(
              onChanged: (value) {
                text = value;
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text("Confirmed")),
        ],
      )),
    );
  }
}
