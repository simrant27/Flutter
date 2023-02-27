import 'package:day_14/app_configuration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchColor extends StatefulWidget {
  SwitchColor({super.key});

  @override
  State<SwitchColor> createState() => _SwitchColorState();
}

class _SwitchColorState extends State<SwitchColor> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfigProvider>(
        builder: (context, appConfigProviderVariable, child) {
      return Row(
        children: [
          Switch(
              value: appConfigProviderVariable.isSwitchToggled,
              onChanged: (v) {
                appConfigProviderVariable.switchToggled();
              }),
          Text(appConfigProviderVariable.textToShow)
        ],
      );
    });
  }
}
