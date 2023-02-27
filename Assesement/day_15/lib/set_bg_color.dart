import 'package:day_15/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SetBgColor extends StatefulWidget {
  void Function(bool) istoggledOn;
  SetBgColor({super.key, required this.istoggledOn});
  @override
  State<SetBgColor> createState() => _SetBgColorState();
}

class _SetBgColorState extends State<SetBgColor> {
  bool isSwitchOn = false;

  @override
  // void initState() {
  //   super.initState();
  //   readSavedData();
  // }

  // Future<void> readSavedData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   bool savedRedBGColorValue = prefs.getBool("isOn") ?? false;

  //   setState(() {
  //     isSwitchOn = savedRedBGColorValue;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Use red Color:"),
                Switch.adaptive(
                  value: isSwitchOn,
                  onChanged: (value) {
                    isSwitchOn = !isSwitchOn;
                    setState(() {
                      widget.istoggledOn(isSwitchOn);
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Confirm")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
