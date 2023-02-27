import 'package:day_16/configuration_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
// Decoration decorate = Decoration(
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerQuantity = TextEditingController();
  // TextEditingController _controllerName = TextEditingController();
  bool _isFavourite = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Consumer<ConfigProvider>(builder: (context, configAdd, child) {
          return Column(
            children: [
              TextField(
                controller: _controllerName,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Enter name of flower"),
              ),
              // Text(configAdd.flowers[0]["name"]),
              TextField(
                controller: _controllerQuantity,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ],
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Enter quantity(integer only)"),
              ),
              DropdownButton<bool>(
                value: _isFavourite,
                items: [
                  DropdownMenuItem(
                    value: true,
                    child: Text("YES"),
                  ),
                  DropdownMenuItem(
                    value: false,
                    child: Text("NO"),
                  ),
                ],
                onChanged: (value) {
                  _isFavourite = value!;
                },
              ),

              FloatingActionButton(
                onPressed: () {
                  Map<String, dynamic> newMap = {
                    "name": _controllerName.text,
                    "favorite": _isFavourite,
                    "quantity": _controllerQuantity.text,
                  };
                  configAdd.flowers.add(newMap);
                  configAdd.addList();

                  Navigator.of(context).pop();
                },
                child: Icon(Icons.add),
              )
              // configAdd.flow
            ],
          );
        }),
      ),
    );
  }
}
