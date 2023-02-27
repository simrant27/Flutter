import 'package:day_16/components/icon_component.dart';
import 'package:day_16/configuration_page.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SingleFruitPage extends StatelessWidget {
  Map flowerDetails;
  // bool favorite;
  SingleFruitPage({
    super.key,
    required this.flowerDetails,
    // required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(flowerDetails['name']),
      ),
      body: Consumer<ConfigProvider>(builder: (context, configsingle, child) {
        return Column(children: [
          IconComponent(
            flowerDetails: flowerDetails,
            sizeofIcon: 50,
          ),
          Text(
            "Quantity:" + flowerDetails['quantity'].toString(),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  configsingle.increaseQuantity(flowerDetails["name"]);
                },
                child: Text("+"),
              ),
            ),
          )
        ]);
      }),
    );
  }
}
