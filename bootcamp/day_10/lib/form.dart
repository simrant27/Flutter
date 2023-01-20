import 'package:day_10/switch.dart';
import 'package:flutter/material.dart';

class Day_09 extends StatefulWidget {
  const Day_09({super.key});

  @override
  State<Day_09> createState() => _Day_09State();
}

class _Day_09State extends State<Day_09> {
  List<String> _colorOption = ["red", "blue", "black"];
  Map<String, dynamic> color = {};
  String _selectedColor = "red";

  String text = "";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _messageEditingCOntoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: stringToColor(_selectedColor),
        // backgroundColor: _selectedColor == "blue"
        //     ? Colors.blue
        //     : _selectedColor == "red"
        //         ? Colors.red
        //         : Colors.green,
        title: IconButton(
            onPressed: () {
              text = "Hello";
              _messageEditingCOntoller.text = text;

              // setState(() {
              //   _messageEditingCOntoller.text = text;
              // });
            },
            icon: Icon(Icons.ads_click)),
        centerTitle: true,

        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         text = "Hello";
        //         _messageEditingCOntoller.text = text;

        //         // setState(() {
        //         //   _messageEditingCOntoller.text = text;
        //         // });
        //       },
        //       icon: Icon(Icons.ads_click))
        // ]
      ),
      body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().length == 0) {
                    return "Enter Something";
                  }
                },
                controller: _messageEditingCOntoller,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      text = _messageEditingCOntoller.text;
                    });
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("All good"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("NOt good"),
                        ),
                      );
                    }
                  },
                  child: Text("Conform")),
              DropdownButton(
                  value: _selectedColor,
                  items: _colorOption
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (a) {
                    setState(() {
                      _selectedColor = a.toString();
                    });
                  })
            ],
          )),
    );
  }

  Color stringToColor(String color) {
    switch (color) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'black':
        return Colors.green;
      default:
        return Colors.amber;
    }
  }
}
