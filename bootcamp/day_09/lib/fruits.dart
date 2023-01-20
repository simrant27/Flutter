import 'package:day_09/single_fruit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

List<String> fruits = ["Apple", "Banana", "Strawberry", "Kiwi", "Oranges"];

class Fruits extends StatelessWidget {
  Fruits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All fruits"),
      ),
      body: ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(fruits[index]),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SingleFruitPage(
                    fruitName: fruits[index],
                  );
                }));
              },
            );
          }),
    );
  }
}
