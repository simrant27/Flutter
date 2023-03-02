import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voting_system/screens/login_screen.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? user;
  bool isloggedIn() {
    return user != null;
  }

  void setUser(User user) {
    this.user = user;
    notifyListeners();
  }

  void logout(BuildContext context) async {
    user = null;
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false);
  }
}
