import 'package:day_16/add_item.dart';
import 'package:day_16/components/icon_component.dart';
import 'package:day_16/configuration_page.dart';
import 'package:day_16/single_fruit_page.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextButton(
            child: Text(
              "Add Item",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddItem(),
              ));
            },
          ),
        ),
        body: Consumer<ConfigProvider>(builder: (context, config, child) {
          return SafeArea(
            child: Column(
              children: [
                Text("Items are:"),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: config.flowers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        onLongPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SingleFruitPage(
                              flowerDetails: config.flowers[index],
                              // favorite: config.flowers[index]["favorite"],
                            ),
                          ));
                        },
                        onTap: () {
                          config
                              .increaseQuantity(config.flowers[index]["name"]);
                        },
                        title: Text(config.flowers[index]["name"] +
                            " " +
                            config.flowers[index]["quantity"].toString()),
                        trailing: IconComponent(
                          flowerDetails: config.flowers[index],
                          sizeofIcon: 30,
                        ));
                  },
                ),
              ],
            ),
          );
        }));
  }
}
