import 'package:day_14/app_configuration_provider.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextEntered extends StatefulWidget {
  // String textToEnter = "";

  @override
  State<TextEntered> createState() => _TextEnteredState();
}

class _TextEnteredState extends State<TextEntered> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfigProvider>(
        builder: (context, appConfigProviderVar, child) {
      return TextField(
        decoration: InputDecoration(
          hintText: "Enter text here",
        ),
        onChanged: (value) {
          setState(() {
            appConfigProviderVar.textChanged(value);
          });
        },
      );
    });
  }
}
