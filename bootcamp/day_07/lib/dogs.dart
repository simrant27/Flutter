import 'package:flutter/material.dart';

void main() {
  runApp(Dogs());
}

class Dogs extends StatelessWidget {
  Dogs({super.key});
  Map<String, String> dog1 = {
    "name": "BHusiya kukur",
    "color": "pink",
  };

  Map<String, String> dog2 = {
    "name": "Asmi",
    "color": "green",
  };
  Map<String, String> dog3 = {
    "name": "Asmita",
    "color": "blue",
  };

  List<Map<String, dynamic>> dogs = [
    {
      "name": "Bhusiya kukur",
      "color": "pink",
      "textColor": Colors.pink,
      "icon": Icon(Icons.abc),
    },
    {
      "name": "Asmi",
      "color": "green",
      "icon": Icon(Icons.abc),
    },
    {
      "name": "Asmita",
      "color": "blue",
      // "icon": Icon(Icons.abc),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dogs"),
        ),
        body: Center(
          child: Column(
            children: [
              for (var dog in dogs)
                ListTile(
                  leading: dog["icon"],
                  title: Text(
                    dog["name"]!,
                    style: TextStyle(
                      color: dog["textColor"],
                    ),
                  ),
                  subtitle: Text(dog["color"]!),
                ),
              ListTile(
                leading: Icon(Icons.donut_large),
                title: Text("MJ"),
                subtitle: Text("grey"),
              ),
              ListTile(
                leading: Icon(Icons.donut_large),
                title: Text("Maau"),
                subtitle: Text("grey"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
