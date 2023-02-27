import 'package:day_14/app_configuration_provider.dart';
import 'package:day_14/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Day_14());
}

class Day_14 extends StatelessWidget {
  const Day_14({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppConfigProvider(),
        )
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
