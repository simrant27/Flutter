import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voting_system/adminScreen/allvotings.dart';
import 'package:voting_system/provider/user_provider.dart';
import 'package:voting_system/utils/constants/constants.dart';
import 'package:voting_system/screens/home_screen.dart';
import 'package:voting_system/screens/login_screen.dart';

import '../models/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(),
              SizedBox(height: 20.0),
              Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedToken = prefs.getString('accessToken');

    if (savedToken == null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      var response = await http.get(Uri.parse("$baseURL/users/me"), headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $savedToken"
      });

      var jsonDecoded = jsonDecode(response.body);
      if (jsonDecoded['status'] == 'success') {
        print("Login found from last saved data");

        Map<String, dynamic> obtainedUser = jsonDecoded['data']['user'];
        obtainedUser['token'] = savedToken;

        User userFromResponse = User.fromJson(obtainedUser);

//put obtained user in provider
        Provider.of<UserProvider>(context, listen: false)
            .setUser(userFromResponse);

// //navigate to homePage
//         (userFromResponse.role == 'admin')
//             ? Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => AllVotings()))
//             : Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => HomeScreen()));

        // return jsonDecoded['data']['user'];
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AllVotings()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    }
  }
}
