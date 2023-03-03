import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/adminScreen/allvotings.dart';
import 'package:voting_system/provider/candidate_provider.dart';
import 'package:voting_system/provider/user_provider.dart';
import 'package:voting_system/provider/voting_provider.dart';
import 'package:voting_system/screens/home_screen.dart';
import 'package:voting_system/screens/splash_screen.dart';
import '/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => VotingProvider()),
      ],
      child: MaterialApp(
        title: 'Form Validation',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
