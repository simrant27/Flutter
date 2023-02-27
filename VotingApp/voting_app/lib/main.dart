import 'package:flutter/material.dart';

import 'package:voting_app/authentication/login.dart';

void main() {
  runApp(VotingApp());
}

class VotingApp extends StatelessWidget {
  const VotingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}
