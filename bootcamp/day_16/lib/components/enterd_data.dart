import 'package:day_16/configuration_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnterData extends StatefulWidget {
  const EnterData({super.key});

  @override
  State<EnterData> createState() => _EnterDataState();
}

class _EnterDataState extends State<EnterData> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigProvider>(builder: (context, configdata, child) {
      return Column(
        children: [TextField()],
      );
    });
  }
}
