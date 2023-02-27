import 'package:day_14/app_configuration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextWritten extends StatelessWidget {
  TextWritten({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<AppConfigProvider>(
          builder: (context, appConfigProviderVariable, child) {
        return Container(
          color: appConfigProviderVariable.isSwitchToggled
              ? Colors.purple.shade100
              : Colors.white,
          child: Center(child: Text(appConfigProviderVariable.textToShow)),
        );
      }),
    );
  }
}
