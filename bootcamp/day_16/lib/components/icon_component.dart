import 'package:day_16/configuration_page.dart';
import 'package:day_16/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconComponent extends StatelessWidget {
  Map flowerDetails;
  double sizeofIcon;

  IconComponent(
      {super.key, required this.flowerDetails, required this.sizeofIcon});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigProvider>(builder: (context, configicon, child) {
      return Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              configicon.toggleFavoroit(flowerDetails["name"]);
            },
            icon: Icon(flowerDetails['favorite']
                ? Icons.favorite
                : Icons.favorite_border_outlined),
            color: Colors.red,
            iconSize: sizeofIcon,
          ),
          IconButton(
              onPressed: () {
                configicon.deleteList(flowerDetails["name"]);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.delete)),
        ],
      );
    });
  }
}
