import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _inputText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(child: Container()),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Enter your Text Here"),
                  TextFormField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.trim().length == 0) {
                        return "enter Something";
                      }
                      if (value.length < 5) {
                        return "Write more than 5 character";
                      }
                      return null;
                    },
                    controller: _inputText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    child: Text("Send"),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        //validation passed
                        print("input data:" + _inputText.text);

                        Map toSend = {
                          "message": _inputText.text,
                        };

                        print(toSend);
                        String toJson = jsonEncode(toSend);

                        print(toJson);
                        var response = await http.post(
                            Uri.parse("http://192.168.250.114:3000/submit-log"),
                            headers: {
                              "Content-Type": "application/json",
                            },
                            body: toJson);
                        print(response.body);
                        _inputText.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please check validation"),
                        ));
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
