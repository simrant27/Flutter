import 'package:flutter/cupertino.dart';

class AppConfigProvider with ChangeNotifier {
  bool isSwitchToggled = true;
  String textToShow = "";

  AppConfigProvider();

  void switchToggled() {
    isSwitchToggled = !isSwitchToggled;
    notifyListeners();
  }

  void textChanged(String text) {
    textToShow = text;
    notifyListeners();
  }
}
