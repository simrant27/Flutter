import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfigProvider with ChangeNotifier {
  List<Map<String, dynamic>> flowers = [
    {
      "name": "Sunflower",
      "favorite": true,
      "quantity": 2,
    },
    {
      "name": "Rose",
      "favorite": false,
      "quantity": 5,
    },
    {
      "name": "Lily",
      "favorite": true,
      "quantity": 1,
    },
    {
      "name": "Lotus",
      "favorite": true,
      "quantity": 6,
    },
  ];

  ConfigProvider();

  void toggleFavoroit(String name) {
    for (int i = 0; i < flowers.length; i++) {
      if (name == flowers[i]["name"]) {
        flowers[i]['favorite'] = !flowers[i]['favorite'];
      }
    }
    notifyListeners();
  }

  void increaseQuantity(String name) {
    for (int i = 0; i < flowers.length; i++) {
      if (name == flowers[i]["name"]) {
        flowers[i]['quantity']++;
      }
    }
    notifyListeners();
  }

  void deleteList(String name) {
    for (int i = 0; i < flowers.length; i++) {
      if (name == flowers[i]["name"]) {
        flowers.removeAt(i);
      }
    }
    notifyListeners();
  }

  void addList() {
    notifyListeners();
  }
}
