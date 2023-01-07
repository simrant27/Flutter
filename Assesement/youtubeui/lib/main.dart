import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(Youtube());
}

class Youtube extends StatelessWidget {
  const Youtube({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
