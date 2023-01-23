import 'package:day_10/switch.dart';
import 'package:flutter/material.dart';

class ColorMap extends StatefulWidget {
  const ColorMap({super.key});

  @override
  State<ColorMap> createState() => _ColorMapState();
}

class _ColorMapState extends State<ColorMap> {
  List<Map<String, dynamic>> _colorOption = [
    {
      "title": "red",
      "value": Colors.red,
    },
    {
      "title": "blue",
      "value": Colors.blue,
    },
    {
      "title": "black",
      "value": Colors.green,
    },
  ];

  String text = "";

  late Color _selectedColor = _colorOption[0]['value'];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _messageEditingCOntoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _selectedColor,

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
                          child: Text(e["title"]), value: e['value']))
                      .toList(),
                  onChanged: (a) {
                    setState(() {
                      _selectedColor = a as Color;
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
