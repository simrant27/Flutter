import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class TextEntered extends StatefulWidget {
  // String textToEnter = "";
  void Function(String) textToEnter;
  TextEntered({
    super.key,
    required this.textToEnter,
  });

  @override
  State<TextEntered> createState() => _TextEnteredState();
}

class _TextEnteredState extends State<TextEntered> {
  TextEditingController _textEntered = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEntered,
      decoration: InputDecoration(
        hintText: "Enter text here",
      ),
      onChanged: (value) {
        setState(() {
          widget.textToEnter(_textEntered.text);
        });
      },
    );
  }
}
