import 'package:flutter/material.dart';

class SwitchColor extends StatefulWidget {
  void Function(bool) isSwitch;
  SwitchColor({super.key, required this.isSwitch});

  @override
  State<SwitchColor> createState() => _SwitchColorState();
}

class _SwitchColorState extends State<SwitchColor> {
  bool isSwitchOn = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: (isSwitchOn) ? Icon(Icons.toggle_off) : Icon(Icons.toggle_on),
      onPressed: () {
        setState(() {
          isSwitchOn = !isSwitchOn;
          widget.isSwitch(isSwitchOn);
        });
      },
    );
  }
}
