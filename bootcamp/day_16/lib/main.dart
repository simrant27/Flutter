import 'package:day_16/configuration_page.dart';
import 'package:day_16/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Day_16());
}

class Day_16 extends StatelessWidget {
  const Day_16({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConfigProvider())
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
